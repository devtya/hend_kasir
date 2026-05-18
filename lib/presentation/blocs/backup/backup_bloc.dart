import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/backup_repository.dart';
import 'backup_event.dart';
import 'backup_state.dart';

class BackupBloc extends Bloc<BackupEvent, BackupState> {
  final BackupRepository _repository;

  BackupBloc({required BackupRepository repository})
    : _repository = repository,
      super(BackupInitial()) {
    on<BackupToExcel>(_onBackupToExcel);
    on<RestoreFromExcel>(_onRestoreFromExcel);
  }

  Future<void> _onBackupToExcel(
    BackupToExcel event,
    Emitter<BackupState> emit,
  ) async {
    emit(BackupLoading());
    try {
      final path = await _repository.exportToExcel();
      emit(BackupSuccess('Backup berhasil. File tersimpan di:\n$path'));
    } catch (e) {
      emit(BackupError('Gagal export: ${e.toString()}'));
    }
  }

  Future<void> _onRestoreFromExcel(
    RestoreFromExcel event,
    Emitter<BackupState> emit,
  ) async {
    emit(BackupLoading());
    try {
      final result = await _repository.restoreFromExcel(event.filePath);
      emit(BackupSuccess(result.message, result: result));
    } catch (e) {
      emit(BackupError('Gagal restore: ${e.toString()}'));
    }
  }
}
