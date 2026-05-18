import '../../data/models/backup_result.dart';

abstract class BackupRepository {
  Future<String> exportToExcel();
  Future<BackupResult> restoreFromExcel(String filePath);
}
