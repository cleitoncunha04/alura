import 'package:clean_arch_project/presenter/screen/categories/categories_screen.dart';
import 'package:clean_arch_project/presenter/screen/details/details_screen.dart';
import 'package:clean_arch_project/presenter/screen/entry_list/entry_list_screen.dart';
import 'package:clean_arch_project/utils/consts/routes_enum.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static Route? generateRoutes(RouteSettings settings) {
    if (settings.name == RoutesEnum.categories.route) {
      return MaterialPageRoute(
        builder: (_) => const CategoriesScreen(),
      );
    } else if (settings.name == RoutesEnum.details.route) {
      return MaterialPageRoute(
        builder: (_) => const DetailsScreen(),
      );
    } else if (settings.name == RoutesEnum.entries.route) {
      final args = settings.arguments as Map<String, dynamic>;

      return MaterialPageRoute(
        builder: (_) => EntryListScreen(
          isFavorite: args['isFavorite'],
        ),
      );
    } else {
      return null;
    }
  }
}
