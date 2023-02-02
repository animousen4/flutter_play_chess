abstract class CategoryVariant {
  String get name;
}

class RegularCategory extends CategoryVariant {
  @override
  String get name => "gameSetting.category.regular";
}

class OtherCategory extends CategoryVariant {
  @override
  String get name => "gameSetting.category.other";
}
