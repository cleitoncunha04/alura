import 'package:clean_arch_project/data/model/entry_model.dart';

abstract class DatabaseManager {
  Future<List<EntryModel>> getAllAddedEntriesModel();
  Future<void> saveEntryModel(EntryModel entry);
  Future<void> deleteEntryModel(int id);
}
