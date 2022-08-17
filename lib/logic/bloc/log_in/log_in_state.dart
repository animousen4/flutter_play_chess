part of 'log_in_bloc.dart';

enum FormStatus { initial, submitting, success, fail }

class LogInState {
  final FormStatus formStatus;

  LogInState({required this.formStatus});
}
