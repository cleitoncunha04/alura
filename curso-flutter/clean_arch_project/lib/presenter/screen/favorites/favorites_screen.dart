import 'package:clean_arch_project/presenter/cubit/home_cubit.dart';
import 'package:clean_arch_project/presenter/widget/entry_list_card_component.dart';
import 'package:clean_arch_project/utils/consts/categories_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late CategoriesEnum category;

  @override
  void initState() {
    category = context.read<HomeCubit>().state.selectedCategory;

    context.read<HomeCubit>().getAllSavedEntries();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorites',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeError) {
              return Center(
                child: Text(
                  'An error occured: ${state.message}',
                ),
              );
            } else {
              return state.savedEntries.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (context, index) => EntryListCardComponent(
                        entryModel: state.savedEntries[index],
                        isFavorite: true,
                      ),
                      itemCount: state.savedEntries.length,
                    )
                  : const Center(
                      child: Text(
                        'Empty list...',
                      ),
                    );
            }
          },
        ),
      ),
    );
  }
}
