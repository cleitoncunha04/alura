import 'package:clean_arch_project/presenter/cubit/home_cubit.dart';
import 'package:clean_arch_project/presenter/widget/custom_app_bar.dart';
import 'package:clean_arch_project/presenter/widget/entry_list_card_component.dart';
import 'package:clean_arch_project/utils/consts/categories_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryListScreen extends StatefulWidget {
  const EntryListScreen({super.key});

  @override
  State<EntryListScreen> createState() => _EntryListScreenState();
}

class _EntryListScreenState extends State<EntryListScreen> {
  late CategoriesEnum category;

  @override
  void initState() {
    category = context.read<HomeCubit>().state.selectedCategory;

    context.read<HomeCubit>().fetchHyruleEntriesByCategory(
          category: category.name,
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(
          text: category.text,
          isCenter: false,
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
              return state.hyruleEntriesByCategory.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EntryListCardComponent(
                          entryModel: state.hyruleEntriesByCategory[index],
                          isFavorite: false,
                        ),
                      ),
                      itemCount: state.hyruleEntriesByCategory.length,
                    )
                  : Container();
            }
          },
        ),
      ),
    );
  }
}
