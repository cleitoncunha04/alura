import 'package:floor/floor.dart';

@entity
class FloorEntryModel {
  @primaryKey
  final int id;

  final String name;

  final String image;

  final String description;

  final String commonLocactions;

  final String category;

  FloorEntryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.commonLocactions,
    required this.category,
  });
}
