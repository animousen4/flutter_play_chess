part of 'game_status_bloc.dart';

@immutable
sealed class GameStatusEvent {}

class _GameStatusChanged extends GameStatusEvent {
  final GameStatus? newStatus;

  _GameStatusChanged({required this.newStatus});
}
