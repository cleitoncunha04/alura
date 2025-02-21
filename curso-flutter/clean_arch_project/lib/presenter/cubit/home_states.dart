part of 'home_cubit.dart';

class HomeStates {
  HomeStates({
    required this.savedEntries,
    required this.hyruleEntriesByCategory,
    required this.selectedEntry,
    required this.selectedCategory,
  });

  final List<EntryModel> savedEntries;
  final List<EntryModel> hyruleEntriesByCategory;
  final EntryModel selectedEntry;
  final CategoriesEnum selectedCategory;

  HomeStates copyWith({
    EntryModel? selectedEntry,
    CategoriesEnum? selectedCategory,
    List<EntryModel>? savedEntries,
    List<EntryModel>? hyruleEntriesByCategory,
  }) {
    return HomeStates(
      selectedEntry: selectedEntry ?? this.selectedEntry,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      savedEntries: savedEntries ?? this.savedEntries,
      hyruleEntriesByCategory: hyruleEntriesByCategory ?? this.hyruleEntriesByCategory,
    );
  }
}

class HomeInitial extends HomeStates {
  HomeInitial({
    required super.selectedEntry,
    required super.selectedCategory,
    required super.savedEntries,
    required super.hyruleEntriesByCategory,
  });
}

class HomeLoading extends HomeStates {
  HomeLoading({
    required super.selectedEntry,
    required super.selectedCategory,
    required super.savedEntries,
    required super.hyruleEntriesByCategory,
  });
}

class HomeError extends HomeStates {
  HomeError({
    required this.message,
    required super.selectedEntry,
    required super.selectedCategory,
    required super.savedEntries,
    required super.hyruleEntriesByCategory,
  });

  final String message;

  @override
  HomeError copyWith({
    EntryModel? selectedEntry,
    String? message,
    CategoriesEnum? selectedCategory,
    List<EntryModel>? savedEntries,
    List<EntryModel>? hyruleEntriesByCategory,
  }) {
    return HomeError(
      selectedEntry: selectedEntry ?? this.selectedEntry,
      message: message ?? this.message,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      savedEntries: savedEntries ?? this.savedEntries,
      hyruleEntriesByCategory: hyruleEntriesByCategory ?? this.hyruleEntriesByCategory,
    );
  }
}

class HomeSuccess extends HomeStates {
  HomeSuccess({
    required super.selectedEntry,
    required super.selectedCategory,
    required super.savedEntries,
    required super.hyruleEntriesByCategory,
  });
}
