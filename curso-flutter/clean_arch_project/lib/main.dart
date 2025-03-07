import 'package:clean_arch_project/data/database/database_manager.dart';
import 'package:clean_arch_project/data/database/floor/app_database.dart';
import 'package:clean_arch_project/data/database/floor/floor_manager_impl.dart';
import 'package:clean_arch_project/data/repository/hyrule_repository_impl.dart';
import 'package:clean_arch_project/domain/repository/hyrule_repository.dart';
import 'package:clean_arch_project/presenter/di/cubit_injector.dart';
import 'package:clean_arch_project/presenter/route/app_router.dart';
import 'package:clean_arch_project/presenter/screen/categories/categories_screen.dart';
import 'package:clean_arch_project/utils/consts/my_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AppDatabase appDatabase = await AppDatabase.createDatabase();

  final DatabaseManager databaseManager =
      FloorManagerImpl(datasource: appDatabase.floorDatasource);

  final HyruleRepository hyruleRepository = HyruleRepositoryImpl();

  runApp(
    BlocProvider(
      create: (context) => CubitInjector.provideHomeCuit(
        databaseManager: databaseManager,
        hyruleRepository: hyruleRepository,
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
      debugShowCheckedModeBanner: false,
      title: 'Hyrule',
      theme: MyThemes.themeData,
      home: const CategoriesScreen(),
      onGenerateRoute: AppRouter.generateRoutes,
    );
  }
}
