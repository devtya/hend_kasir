import 'package:equatable/equatable.dart';

import '../../../data/models/backup_result.dart';

abstract class BackupState extends Equatable {
  const BackupState();
  @override
  List<Object?> get props => [];
}

class BackupInitial extends BackupState {}

class BackupLoading extends BackupState {}

class BackupSuccess extends BackupState {
  final String message;
  final BackupResult? result;
  const BackupSuccess(this.message, {this.result});
  @override
  List<Object?> get props => [message, result];
}

class BackupError extends BackupState {
  final String message;
  const BackupError(this.message);
  @override
  List<Object?> get props => [message];
}
