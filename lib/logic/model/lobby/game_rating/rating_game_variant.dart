abstract class RatingVariant {
  String get status;
}

class EnabledRating extends RatingVariant {
  @override
  String get status => "gameSetting.rating.on";

}

class DisabledRating extends RatingVariant {
  @override
  String get status => "gameSetting.rating.off";

}