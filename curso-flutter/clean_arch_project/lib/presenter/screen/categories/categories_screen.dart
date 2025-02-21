import 'package:clean_arch_project/presenter/screen/categories/components/category_component.dart';
import 'package:clean_arch_project/presenter/widget/custom_app_bar.dart';
import 'package:clean_arch_project/utils/consts/categories_enum.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: const CustomAppBar(
          text: 'Select a category',
          isCenter: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 24.0,
          ),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 16,
            ),
            children: CategoriesEnum.values
                .where((c) => c != CategoriesEnum.none)
                .map(
                  (c) => CategoryComponent(category: c),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
