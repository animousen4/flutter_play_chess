class Reason {
  Reason();
  factory Reason.notFound() => NotFoundReason();
}

class NotFoundReason extends Reason {}
