enum RoutesEnum {
  categories,
  entries,
  details,
  favorites,
}

extension RoutesNames on RoutesEnum {
  String get route => '/$name';
}
