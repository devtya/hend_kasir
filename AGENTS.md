# AGENTS.md — hend_kasir

## Stack

- **Framework**: Flutter (Dart SDK ^3.11.5)
- **State Management**: flutter_bloc ^9.1 + equatable ^2.0
- **Database**: drift ^2.25 + sqlite3_flutter_libs (SQLite ORM)
- **DI**: get_it ^8.0
- **Barcode**: mobile_scanner ^6.0
- **Linting**: flutter_lints ^6.0

## Project structure (Clean Architecture)

```
lib/
  core/          theme, constants, DI (get_it), errors
  data/          database/ (Drift tables + AppDatabase), models/, repositories/
  domain/        entities/, repositories/ (abstract interfaces), usecases/
  presentation/  blocs/, pages/, widgets/
```

## Key commands

| Command | When |
|---------|------|
| `flutter analyze` | Lint + typecheck in one step. Run before committing. |
| `dart run build_runner build` | After modifying any Drift table or adding @DriftDatabase decorator. Generates `*.g.dart`. |
| `flutter run --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...` | Debug dengan Supabase sync aktif. |
| `flutter build apk --debug --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...` | **Default** — build debug APK dengan Supabase sync. |
| `flutter build apk --release --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...` | Build release APK (final). |
| `flutter build windows --debug --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...` | Build Windows desktop debug. Requires **Visual Studio** (Desktop C++ workload) + **Developer Mode** enabled. |
| `flutter build windows --release --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...` | Build Windows desktop release. |
| `flutter run -d windows --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...` | Run di Windows desktop. |
| `flutter test` | Run all tests. |

## Database (Drift)

- **16 tables**: 15 original + `SyncRecordTable` untuk UUID mapping sync
- Defined in `lib/data/database/tables/`, aggregated in `lib/data/database/app_database.dart`
- **Schema version 7**: v1→v6 original migrations, v6→v7 adds `SyncRecordTable`
- Connection via `LazyDatabase` → `NativeDatabase` (file: `hend_kasir.db` in app docs dir)

## Supabase Sync

- **Offline-first**: Drift tetap primary, Supabase sebagai cloud sync
- **Auto-sync** via `SyncBloc` tiap 5 menit + saat app foreground
- `SyncRecordTable` di Drift mapping `(tableEntity, localId) ↔ uuid` untuk resolusi antar device
- `SupabaseSyncService.push()`: upload data yang berubah ke Supabase `records` table
- `SupabaseSyncService.pull()`: download data dari device lain, resolve FK via UUID
- **Auth tetap lokal** — tidak menggunakan Supabase Auth
- Konfigurasi Supabase via `--dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...`
- File `supabase_setup.sql` untuk setup tabel di Supabase project
- Defined in `lib/data/database/tables/`, aggregated in `lib/data/database/app_database.dart`
- **Never override `primaryKey`** when using `autoIncrement()` — Drift handles it automatically
- Connection via `LazyDatabase` → `NativeDatabase` (file: `hend_kasir.db` in app docs dir)
- Schema version bump → update `schemaVersion` getter + add migration logic

## DI

- Central `sl` (GetIt instance) in `lib/core/di/injection.dart`
- `initDependencies()` called once at app startup in `main()` before `runApp`
- Register repos/usecases as `sl.registerLazySingleton<T>(() => ...)`
- Register BLoCs as `sl.registerFactory()` (new instance per page), repos/usecases as `sl.registerLazySingleton()`

## Conventions

- **Entities** extend `Equatable` with `copyWith()`
- **Repository interfaces** in `domain/repositories/`, implementations in `data/repositories/`
- **Theme**: System theme (`ThemeMode.system`) default, light & dark themes defined in `AppTheme` — `lib/core/theme/app_theme.dart`. Gunakan `ThemeCubit` untuk toggle (light/dark/system), persist ke `SharedPreferences`.
- **ProdukFormPage**: Multi-satuan dengan auto-konversi harga pokok. Saat harga pokok satuan konversi diisi, harga pokok satuan dasar otomatis dihitung ulang (`hargaPokok / konversi`).
- Drift generates data classes with same names as domain entities (e.g., `Produk`). Disambiguate in repo impl with import alias: `import '.../entities/produk.dart' as domain`
- **BLoCs** use `Bloc<Event, State>`, events defined in `*_event.dart`, states in `*_state.dart`
- Register BLoCs as `sl.registerFactory()` (new instance per page), repos/usecases as `sl.registerLazySingleton()`
- **ThemeCubit** registered as `registerLazySingleton` di `injection.dart`
- No git repo initialized yet — `git init` required if committing
- No `opencode.json` or other agent config files exist

## Windows Platform

- **Barcode input**: `mobile_scanner` tidak support Windows. Gunakan `showBarcodeScannerDialog(context)` di `lib/presentation/widgets/barcode_scanner_widget.dart`. Di Windows nampilin `TextField` manual (kompatibel USB keyboard-wedge scanner), di Android pakai kamera `MobileScanner`.
- **Theme**: System theme otomatis aktif di Windows. Bisa diganti manual lewat Settings page.
- **Build prerequisites**: Visual Studio (Desktop C++ workload) + Windows Developer Mode (Settings → Privacy & Security → For Developers).
