import 'package:flutter_play_chess/logic/error/app_error.dart';

abstract class Status {
  static InitialStatus initial() => InitialStatus();
  static OkStatus ok() => OkStatus();
  static SubmittingStatus submitting() => SubmittingStatus();
  static SubmissionSuccess submissionSuccess() => SubmissionSuccess();
  static SubmissionFailedStatus submissionFailed<T>(T? reason) => SubmissionFailedStatus(reason: reason);
  static ErrorStatus error(AppError? error) => ErrorStatus(error: error);
}

class InitialStatus extends Status {}

class OkStatus extends Status {}

class SubmittingStatus extends Status {}

class SubmissionSuccess extends Status {}

class SubmissionFailedStatus<T> extends Status {
  final T? reason;

  SubmissionFailedStatus({this.reason});
}

class ErrorStatus extends Status {
  final AppError? error;

  ErrorStatus({this.error});
}
