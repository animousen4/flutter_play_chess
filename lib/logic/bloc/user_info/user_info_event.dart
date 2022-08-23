part of 'user_info_bloc.dart';

@immutable
abstract class UserInfoEvent {}

class GetUsername extends UserInfoEvent {
  final int id;

  GetUsername({required this.id});
}
