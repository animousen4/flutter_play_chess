part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpReady extends SignUpState {

  final AppException? appException;

  final bool? usernameCorrect;
  final bool? passwordCorrect;
  final bool? emailCorrect;

  SignUpReady({this.usernameCorrect, this.passwordCorrect, this.emailCorrect, this.appException});
}

