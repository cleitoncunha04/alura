import 'package:mvc_project/dao/book_database.dart';
import 'package:mvc_project/models/personal_book_model.dart';

class BookController {
  final PersonalBookDatabase _personalBookDatabase = PersonalBookDatabase();

  Future<void> save({
    required PersonalBook book,
  }) async =>
      await _personalBookDatabase.save(book);

  Future<List<PersonalBook>> findAll() async =>
      await _personalBookDatabase.findAll();

  Future<void> remove({
    required PersonalBook book,
  }) async =>
      await _personalBookDatabase.delete(book);
}
