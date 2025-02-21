import 'package:clean_arch_project/data/database/database_manager.dart';
import 'package:clean_arch_project/domain/usecase/usecase.dart';

class DeleteLocalEntry implements UseCase<void, ParamsDeleteLocalEntry> {
  DeleteLocalEntry({required DatabaseManager databaseManager})
      : _databaseManager = databaseManager;

  final DatabaseManager _databaseManager;

  @override
  Future<void> call(ParamsDeleteLocalEntry params) async =>
      await _databaseManager.deleteEntryModel(
        params.id,
      );
}

class ParamsDeleteLocalEntry {
  ParamsDeleteLocalEntry({
    required this.id,
  });

  final int id;
}
