import 'package:equatable/equatable.dart';

abstract class NotifikasiEvent extends Equatable {
  const NotifikasiEvent();

  @override
  List<Object> get props => [];
}

class LoadNotifikasi extends NotifikasiEvent {}

class MarkNotifikasiAsRead extends NotifikasiEvent {
  final int id;

  const MarkNotifikasiAsRead(this.id);

  @override
  List<Object> get props => [id];
}

class MarkAllNotifikasiAsRead extends NotifikasiEvent {}
