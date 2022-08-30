part of 'safe_bloc.dart';

@immutable
abstract class SafeEvent {}

class _OccureError extends SafeEvent {
  final AppException exception;
  final StackTrace? stackTrace;

  _OccureError({required this.exception, this.stackTrace });
}
