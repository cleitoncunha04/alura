import 'dart:convert';

import 'package:mvc_project/models/google_book_model.dart';

class PersonalBook {
  PersonalBook({
    this.id,
    required this.dayStarted,
    required this.dayFinished,
    required this.comments,
    required this.googleBook,
  });

  int? id;
  String dayStarted;
  String dayFinished;
  String comments;
  GoogleBook googleBook;

  PersonalBook.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        dayStarted = map['dayStarted'],
        dayFinished = map['dayFinished'],
        comments = map['comments'],
        googleBook = GoogleBook.fromJson(
          json.decode(
            map['googleBook'],
          ),
        );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      'dayStarted': dayStarted,
      'dayFinished': dayFinished,
      'comments': comments,
      "googleBook": json.encode(
        googleBook.toMap(),
      ),
    };
  }
}