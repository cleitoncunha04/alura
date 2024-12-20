import 'package:bloc_cubit_project/models/classification_enum.dart';

class MovieModel {
  MovieModel({
    required this.name,
    required this.classification,
    required this.duration,
    required this.sinopse,
    required this.genre,
    required this.imageURI,
    required this.sessions,
  });

  String name;
  ClassificationEnum classification;
  String duration;
  String sinopse;
  String genre;
  String? imageURI;
  List<String>? sessions;

  MovieModel.fromJson(Map<String, dynamic> json)
      : name = json['name'].toString(),
        classification = ClassificationEnum.values.firstWhere(
          (element) => element.classification == json['classification'],
        ),
        duration = json['duration'].toString(),
        sinopse = json['sinopse'].toString(),
        genre = json['genre'].toString(),
        imageURI = json['imageURI'].toString() {
    if (json['sessions'] != null) {
      final v = json['sessions'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      sessions = arr0;
    }
  }
}
