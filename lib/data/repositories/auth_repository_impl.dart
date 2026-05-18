import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/database/app_database.dart';
import '../../data/services/sync_helper.dart';
import '../../core/services/toko_service.dart';
import '../../domain/entities/user.dart' as domain;
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AppDatabase _db;
  final SharedPreferences _prefs;
  final SyncHelper _syncHelper;
  final SupabaseClient _supabase;
  final TokoService _tokoService;
  static const String _sessionKey = 'logged_in_user';

  AuthRepositoryImpl(
    this._db,
    this._prefs,
    this._syncHelper,
    this._supabase,
    this._tokoService,
  );

  domain.User _mapUser(UserTableData data) {
    return domain.User(
      id: data.id,
      username: data.username,
      password: data.password,
      role: data.role,
      createdAt: data.createdAt,
    );
  }

  @override
  Future<domain.User?> login(String username, String password) async {
    final data =
        await (_db.select(_db.userTable)
              ..where((u) => u.username.equals(username))
              ..where((u) => u.password.equals(password)))
            .getSingleOrNull();

    if (data != null) {
      final user = _mapUser(data);
      // Simpan session
      final userMap = {
        'id': user.id,
        'username': user.username,
        'role': user.role,
      };
      await _prefs.setString(_sessionKey, jsonEncode(userMap));

      // Pastikan toko_id tersimpan di TokoService
      if (_tokoService.tokoId == null) {
        final tokoData = await (_db.select(_db.tokoTable)
          ..where((t) => t.id.equals(data.tokoId)))
          .getSingleOrNull();
        if (tokoData != null) {
          await _tokoService.save(tokoData.id, tokoData.nama);
        }
      }

      return user;
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await _prefs.remove(_sessionKey);
  }

  @override
  Future<domain.User?> getCurrentUser() async {
    final sessionString = _prefs.getString(_sessionKey);
    if (sessionString != null) {
      try {
        final map = jsonDecode(sessionString) as Map<String, dynamic>;
        final id = map['id'] as int;
        final data = await (_db.select(
          _db.userTable,
        )..where((u) => u.id.equals(id))).getSingleOrNull();
        if (data != null) {
          return _mapUser(data);
        } else {
          await logout();
        }
      } catch (e) {
        await logout();
      }
    }
    return null;
  }

  @override
  Future<List<domain.User>> getAllUsers() async {
    final data = await _db.select(_db.userTable).get();
    return data.map(_mapUser).toList();
  }

  @override
  Future<int> addUser(domain.User user) async {
    final newId = await _db
        .into(_db.userTable)
        .insert(
          UserTableCompanion(
            username: Value(user.username),
            password: Value(user.password),
            role: Value(user.role),
            tokoId: const Value(1),
          ),
        );
    await _syncHelper.onInsert(tableEntity: 'user', localId: newId);
    return newId;
  }

  @override
  Future<void> updateUser(domain.User user) async {
    final existing = await (_db.select(_db.userTable)
      ..where((u) => u.id.equals(user.id!)))
      .getSingleOrNull();
    if (existing == null) return;
    await _db
        .update(_db.userTable)
        .replace(
          UserTableData(
            id: user.id!,
            username: user.username,
            password: user.password,
            role: user.role,
            tokoId: existing.tokoId,
            createdAt: user.createdAt ?? DateTime.now(),
          ),
        );
    await _syncHelper.onUpdate(tableEntity: 'user', localId: user.id!);
  }

  @override
  Future<void> deleteUser(int id) async {
    await (_db.delete(_db.userTable)..where((u) => u.id.equals(id))).go();
    await _syncHelper.onDelete(tableEntity: 'user', localId: id);
  }

  @override
  Future<domain.User> registerStore({
    required String namaToko,
    String? alamat,
    required String username,
    required String password,
  }) async {
    // 1. Insert store ke Supabase, dapetin toko_id
    final response = await _supabase.from('stores').insert({
      'name': namaToko,
      'address': alamat,
    }).select('id').single();
    final tokoId = response['id'] as int;

    // 2. Simpan ke local Drift
    await _db.into(_db.tokoTable).insert(
      TokoTableCompanion(
        nama: Value(namaToko),
        alamat: Value(alamat),
      ),
    );

    // 3. Simpan ke TokoService
    await _tokoService.save(tokoId, namaToko);

    // 4. Buat admin user
    final newId = await _db.into(_db.userTable).insert(
      UserTableCompanion(
        username: Value(username),
        password: Value(password),
        role: const Value('admin'),
        tokoId: Value(tokoId),
      ),
    );
    await _syncHelper.onInsert(tableEntity: 'user', localId: newId);

    // 5. Simpan session
    final userMap = {
      'id': newId,
      'username': username,
      'role': 'admin',
    };
    await _prefs.setString(_sessionKey, jsonEncode(userMap));

    return domain.User(
      id: newId,
      username: username,
      password: password,
      role: 'admin',
    );
  }
}
