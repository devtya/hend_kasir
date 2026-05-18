import 'package:equatable/equatable.dart';

abstract class BackupEvent extends Equatable {
  const BackupEvent();
  @override
  List<Object?> get props => [];
}

class BackupToExcel extends BackupEvent {}

class RestoreFromExcel extends BackupEvent {
  final String filePath;
  const RestoreFromExcel(this.filePath);
  @override
  List<Object?> get props => [filePath];
}
