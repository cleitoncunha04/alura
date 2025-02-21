import 'package:clean_arch_project/data/database/database_manager.dart';
import 'package:clean_arch_project/data/model/entry_model.dart';
import 'package:clean_arch_project/domain/usecase/usecase.dart';

class GetAllAddedEntriesModel
    implements UseCase<List<EntryModel>, ParamsGetAllAddedEntriesModel> {
  final DatabaseManager _databaseManager;

  GetAllAddedEntriesModel({
    required DatabaseManager databaseManager,
  }) : _databaseManager = databaseManager;

  @override
  Future<List<EntryModel>> call(ParamsGetAllAddedEntriesModel params) async =>
      await _databaseManager.getAllAddedEntriesModel();
}

class ParamsGetAllAddedEntriesModel {}
