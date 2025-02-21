enum CategoriesEnum {
  creatures,
  monsters,
  materials,
  equipment,
  treasure,
  none,
}

extension CategoriesExtension on CategoriesEnum {
  String get text {
    switch (this) {
      case CategoriesEnum.creatures:
        return 'Creatures';
      case CategoriesEnum.monsters:
        return 'Monsters';
      case CategoriesEnum.materials:
        return 'Materials';
      case CategoriesEnum.equipment:
        return 'Equipments';
      case CategoriesEnum.treasure:
        return 'Treasures';
      case CategoriesEnum.none:
        return '';
      default:
        return '';
    }
  }
}