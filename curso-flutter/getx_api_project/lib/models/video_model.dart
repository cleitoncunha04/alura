import 'dart:convert';

class VideoModel {
  VideoModel({
    this.id,
    this.userId,
    required this.thumbURL,
    required this.title,
  });

  final int? id;
  final int? userId;
  final String thumbURL;
  final String title;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'thumbURL': thumbURL,
      'title': title,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id'] != null ? map['id'] as int : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      thumbURL: map['thumbURL'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(
        toMap(),
      );

  static List<VideoModel> listFromJson(dynamic json) {
    return List<VideoModel>.from(
      json.map(
        (video) => VideoModel.fromMap(video),
      ),
    );
  }

  factory VideoModel.fromJson(String source) => VideoModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
