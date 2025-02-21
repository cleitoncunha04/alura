
import 'package:bloc/bloc.dart';
import 'package:clean_arch_project/data/model/entry_model.dart';
import 'package:clean_arch_project/domain/usecase/delete_local_entry.dart';
import 'package:clean_arch_project/domain/usecase/find_entries_by_category.dart';
import 'package:clean_arch_project/domain/usecase/get_all_added_entries_model.dart';
import 'package:clean_arch_project/domain/usecase/save_local_entry_model.dart';
import 'package:clean_arch_project/utils/consts/categories_enum.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit({
    required FindEntriesByCategory findEntriesByCategory,
    required GetAllAddedEntriesModel getAllAddedEntriesModel,
    required SaveLocalEntryModel saveLocalEntryModel,
    required DeleteLocalEntry deleteLocalEntry,
  })  : _findEntriesByCategory = findEntriesByCategory,
        _getAllAddedEntriesModel = getAllAddedEntriesModel,
        _saveLocalEntryModel = saveLocalEntryModel,
        _deleteLocalEntry = deleteLocalEntry,
        super(
          HomeInitial(
            selectedEntry: EntryModel.initial(),
            selectedCategory: CategoriesEnum.none,
            savedEntries: [],
            hyruleEntriesByCategory: [],
          ),
        );

  final FindEntriesByCategory _findEntriesByCategory;
  final GetAllAddedEntriesModel _getAllAddedEntriesModel;
  final SaveLocalEntryModel _saveLocalEntryModel;
  final DeleteLocalEntry _deleteLocalEntry;

  void changeSelectedEntry({required EntryModel entry}) {
    emit(
      state.copyWith(
        selectedEntry: entry,
      ),
    );
  }

  void changeSelectedCategory({required CategoriesEnum category}) {
    emit(
      state.copyWith(
        selectedCategory: category,
      ),
    );
  }

  void changeStateToError({required String message}) {
    emit(
      HomeError(
        message: message,
        hyruleEntriesByCategory: state.hyruleEntriesByCategory,
        savedEntries: state.savedEntries,
        selectedCategory: state.selectedCategory,
        selectedEntry: state.selectedEntry,
      ),
    );
  }

  Future<void> fetchHyruleEntriesByCategory({required String category}) async {
    emit(
      HomeLoading(
        selectedEntry: state.selectedEntry,
        selectedCategory: state.selectedCategory,
        savedEntries: state.savedEntries,
        hyruleEntriesByCategory: state.hyruleEntriesByCategory,
      ),
    );

    try {
      List<EntryModel> entries = (await _findEntriesByCategory.call(
        ParamsFindEntriesByCategory(
          category: category,
        ),
      ))
          .cast<EntryModel>();

      emit(
        HomeSuccess(
          selectedEntry: state.selectedEntry,
          selectedCategory: state.selectedCategory,
          savedEntries: state.savedEntries,
          hyruleEntriesByCategory: entries,
        ),
      );
    } on Exception catch (e) {
      emit(
        HomeError(
          message: e.toString(),
          selectedEntry: state.selectedEntry,
          selectedCategory: state.selectedCategory,
          savedEntries: state.savedEntries,
          hyruleEntriesByCategory: [],
        ),
      );
    }
  }

  Future<void> getAllSavedEntries() async {
    emit(
      HomeLoading(
        selectedEntry: state.selectedEntry,
        selectedCategory: state.selectedCategory,
        savedEntries: state.savedEntries,
        hyruleEntriesByCategory: state.hyruleEntriesByCategory,
      ),
    );

    try {
      List<EntryModel> entries = await _getAllAddedEntriesModel.call(
        ParamsGetAllAddedEntriesModel(),
      );

      emit(
        HomeSuccess(
          selectedEntry: state.selectedEntry,
          selectedCategory: state.selectedCategory,
          savedEntries: entries,
          hyruleEntriesByCategory: state.hyruleEntriesByCategory,
        ),
      );
    } on Exception catch (e) {
      emit(
        HomeError(
          message: e.toString(),
          selectedEntry: state.selectedEntry,
          selectedCategory: state.selectedCategory,
          savedEntries: [],
          hyruleEntriesByCategory: state.hyruleEntriesByCategory,
        ),
      );
    }
  }

  Future<void> saveLocalEntryModel({required EntryModel entryModel}) async {
    emit(
      HomeLoading(
        selectedEntry: state.selectedEntry,
        selectedCategory: state.selectedCategory,
        savedEntries: state.savedEntries,
        hyruleEntriesByCategory: state.hyruleEntriesByCategory,
      ),
    );

    try {
      await _saveLocalEntryModel.call(
        ParamsSaveLocalEntryModel(
          entryModel: entryModel,
        ),
      );

      await getAllSavedEntries();

      emit(
        HomeSuccess(
          selectedEntry: state.selectedEntry,
          selectedCategory: state.selectedCategory,
          savedEntries: state.savedEntries,
          hyruleEntriesByCategory: state.hyruleEntriesByCategory,
        ),
      );
    } on Exception catch (e) {
      emit(
        HomeError(
          message: e.toString(),
          selectedEntry: state.selectedEntry,
          selectedCategory: state.selectedCategory,
          savedEntries: state.savedEntries,
          hyruleEntriesByCategory: state.hyruleEntriesByCategory,
        ),
      );
    }
  }

  Future<void> deleteLocalEntry({required int id}) async {
    emit(
      HomeLoading(
        selectedEntry: state.selectedEntry,
        selectedCategory: state.selectedCategory,
        savedEntries: state.savedEntries,
        hyruleEntriesByCategory: state.hyruleEntriesByCategory,
      ),
    );

    try {
      await _deleteLocalEntry.call(
        ParamsDeleteLocalEntry(
          id: id,
        ),
      );

      await getAllSavedEntries();

      emit(
        HomeSuccess(
          selectedEntry: state.selectedEntry,
          selectedCategory: state.selectedCategory,
          savedEntries: state.savedEntries,
          hyruleEntriesByCategory: state.hyruleEntriesByCategory,
        ),
      );
    } on Exception catch (e) {
      emit(
        HomeError(
          message: e.toString(),
          selectedEntry: state.selectedEntry,
          selectedCategory: state.selectedCategory,
          savedEntries: state.savedEntries,
          hyruleEntriesByCategory: state.hyruleEntriesByCategory,
        ),
      );
    }
  }
}
