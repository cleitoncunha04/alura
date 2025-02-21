import 'dart:convert';

import 'package:clean_arch_project/domain/entitiy/entry.dart';

class EntryModel extends Entry {
  EntryModel({
    required super.id,
    required super.name,
    required super.image,
    required super.description,
    required super.commonLocactions,
    required super.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'common_locactions': commonLocactions,
      'category': category,
    };
  }

  factory EntryModel.fromMap(Map<String, dynamic> map) {
    return EntryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      commonLocactions: jsonEncode(map['common_locations'] ?? ['Unknown']),
      category: map['category'] as String,
    );
  }

  List<String> commonLocationConverter() {
    return (jsonDecode(commonLocactions) as List<dynamic>)
        .map(
          (cl) => cl as String,
        )
        .toList();
  }

  String toJson() => json.encode(toMap());

  factory EntryModel.fromJson(String source) => EntryModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  factory EntryModel.initial() {
    return EntryModel(
      id: 0,
      name: 'Unknown',
      image: '',
      description: 'No description available',
      commonLocactions: jsonEncode(['Unknown']),
      category: 'Uncategorized',
    );
  }
}
