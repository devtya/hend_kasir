class BackupResult {
  final int imported;
  final int skipped;
  final String message;

  const BackupResult({
    required this.imported,
    required this.skipped,
    required this.message,
  });
}
