import 'package:clean_arch_project/data/database/database_manager.dart';
import 'package:clean_arch_project/data/model/entry_model.dart';
import 'package:clean_arch_project/domain/usecase/usecase.dart';

class SaveLocalEntryModel implements UseCase<void, ParamsSaveLocalEntryModel> {
  SaveLocalEntryModel({required DatabaseManager databaseManager})
      : _databaseManager = databaseManager;

  final DatabaseManager _databaseManager;

  @override
  Future<void> call(ParamsSaveLocalEntryModel params) async =>
      await _databaseManager.saveEntryModel(
        params.entryModel,
      );
}

class ParamsSaveLocalEntryModel {
  ParamsSaveLocalEntryModel({
    required this.entryModel,
  });
  
  final EntryModel entryModel;
}
