import 'package:clean_arch_project/data/database/database_manager.dart';
import 'package:clean_arch_project/domain/repository/hyrule_repository.dart';
import 'package:clean_arch_project/domain/usecase/delete_local_entry.dart';
import 'package:clean_arch_project/domain/usecase/find_entries_by_category.dart';
import 'package:clean_arch_project/domain/usecase/get_all_added_entries_model.dart';
import 'package:clean_arch_project/domain/usecase/save_local_entry_model.dart';
import 'package:clean_arch_project/presenter/cubit/home_cubit.dart';

class CubitInjector {
  CubitInjector._();

  static HomeCubit provideHomeCuit(
      {required DatabaseManager databaseManager,
      required HyruleRepository hyruleRepository}) {
    return HomeCubit(
      findEntriesByCategory: FindEntriesByCategory(
        hyruleRepository: hyruleRepository,
      ),
      getAllAddedEntriesModel: GetAllAddedEntriesModel(
        databaseManager: databaseManager,
      ),
      saveLocalEntryModel: SaveLocalEntryModel(
        databaseManager: databaseManager,
      ),
      deleteLocalEntry: DeleteLocalEntry(
        databaseManager: databaseManager,
      ),
    );
  }
}
