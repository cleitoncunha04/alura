import 'package:clean_arch_project/data/database/database_manager.dart';
import 'package:clean_arch_project/data/database/floor/app_database.dart';
import 'package:clean_arch_project/data/database/floor/floor_manager_impl.dart';
import 'package:clean_arch_project/data/repository/hyrule_repository_impl.dart';
import 'package:clean_arch_project/domain/repository/hyrule_repository.dart';
import 'package:clean_arch_project/domain/usecase/delete_local_entry.dart';
import 'package:clean_arch_project/domain/usecase/find_entries_by_category.dart';
import 'package:clean_arch_project/domain/usecase/get_all_added_entries_model.dart';
import 'package:clean_arch_project/domain/usecase/save_local_entry_model.dart';
import 'package:clean_arch_project/presenter/cubit/home_cubit.dart';
import 'package:clean_arch_project/presenter/screen/categories/categories_screen.dart';
import 'package:clean_arch_project/presenter/screen/details/details_screen.dart';
import 'package:clean_arch_project/presenter/screen/entry_list/entry_list_screen.dart';
import 'package:clean_arch_project/presenter/screen/favorites/favorites_screen.dart';
import 'package:clean_arch_project/utils/consts/my_themes.dart';
import 'package:clean_arch_project/utils/consts/routes_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

late HomeCubit homeCubit;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AppDatabase appDatabase = await AppDatabase.createDatabase();

  final DatabaseManager databaseManager =
      FloorManagerImpl(datasource: appDatabase.floorDatasource);

  final HyruleRepository hyruleRepository = HyruleRepositoryImpl();

  runApp(
    BlocProvider(
      create: (context) => HomeCubit(
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
      ),
      child: const Hyrule(),
    ),
  );
}

class Hyrule extends StatelessWidget {
  const Hyrule({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hyrule',
      theme: MyThemes.themeData,
      home: const CategoriesScreen(),
      routes: {
        RoutesEnum.categories.route: (context) => const CategoriesScreen(),
        RoutesEnum.entries.route: (context) => const EntryListScreen(),
        RoutesEnum.details.route: (context) => const DetailsScreen(),
        RoutesEnum.favorites.route: (context) => const FavoritesScreen(),
      },
    );
  }
}
