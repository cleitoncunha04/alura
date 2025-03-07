import 'package:animations/animations.dart';
import 'package:clean_arch_project/data/model/entry_model.dart';
import 'package:clean_arch_project/presenter/cubit/home_cubit.dart';
import 'package:clean_arch_project/presenter/widget/custom_app_bar.dart';
import 'package:clean_arch_project/presenter/screen/entry_list/components/entry_list_card_component.dart';
import 'package:clean_arch_project/presenter/screen/entry_list/components/entry_list_short.dart';
import 'package:clean_arch_project/utils/consts/categories_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryListScreen extends StatefulWidget {
  const EntryListScreen({
    super.key,
    required this.isFavorite,
  });

  final bool isFavorite;

  @override
  State<EntryListScreen> createState() => _EntryListScreenState();
}

class _EntryListScreenState extends State<EntryListScreen> {
  late CategoriesEnum category;

  List<EntryModel> entries = [];

  bool isCardView = true;

  void changeListView() {
    setState(() {
      isCardView = !isCardView;
    });
  }

  void _initialize() async {
    if (widget.isFavorite) {
      await context.read<HomeCubit>().getAllSavedEntries();
      if (mounted) {
        entries = context.read<HomeCubit>().state.savedEntries;
      }
    } else {
      category = context.read<HomeCubit>().state.selectedCategory;

      await context.read<HomeCubit>().fetchHyruleEntriesByCategory(
            category: category.name,
          );

      if (mounted) {
        entries = context.read<HomeCubit>().state.hyruleEntriesByCategory;
      }
    }

    setState(() {
      entries.sort(
        (a, b) => a.name.compareTo(b.name),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text: !widget.isFavorite ? category.text : 'Favorites',
          isCenter: false,
          isFavorite: widget.isFavorite,
          isList: true,
          isCardView: isCardView,
          changeListView: changeListView,
        ),
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            return PageTransitionSwitcher(
              transitionBuilder:
                  (child, primaryAnimation, secondaryAnimation) =>
                      FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              ),
              child: KeyedSubtree(
                key: ValueKey(
                    '${isCardView}_${entries.length}'), // Chave dinâmica
                child: state is HomeLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : state is HomeError
                        ? Center(
                            child: Text(
                              'An error occurred: ${state.message}',
                            ),
                          )
                        : entries.isNotEmpty
                            ? ListView.builder(
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: isCardView
                                      ? EntryListCardComponent(
                                          entryModel: entries[index],
                                          isFavorite: false,
                                        )
                                      : EntryListShort(
                                          entryModel: entries[index],
                                          isFavorite: false,
                                        ),
                                ),
                                itemCount: entries.length,
                              )
                            : const Center(
                                child: Text(
                                  "Entries not found",
                                ),
                              ),
              ),
            );
          },
        ),
      ),
    );
  }
}
