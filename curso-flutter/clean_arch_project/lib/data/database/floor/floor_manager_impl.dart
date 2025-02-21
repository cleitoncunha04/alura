import 'package:clean_arch_project/data/converter/entry_model_to_floor_entry_model_converter.dart';
import 'package:clean_arch_project/data/converter/floor_entry_model_converter_to_entry_model.dart';
import 'package:clean_arch_project/data/database/database_manager.dart';
import 'package:clean_arch_project/data/database/floor/floor_datasource.dart';
import 'package:clean_arch_project/data/database/floor/model/floor_entry_model.dart';
import 'package:clean_arch_project/data/model/entry_model.dart';

class FloorManagerImpl implements DatabaseManager {
  FloorManagerImpl({
    required this.datasource,
  });

  final FloorDatasource datasource;

  final EntryModelToFloorEntryModelConverter entryToFloorConverter =
      EntryModelToFloorEntryModelConverter();

  final FloorEntryModelConverterToEntryModel floorToEntryConverter =
      FloorEntryModelConverterToEntryModel();

  @override
  Future<void> saveEntryModel(EntryModel entry) async {
    await datasource.saveEntryModel(
      entryToFloorConverter.convert(entry),
    );
  }

  @override
  Future<void> deleteEntryModel(int id) async {
    await datasource.deleteEntryModel(id);
  }

  @override
  Future<List<EntryModel>> getAllAddedEntriesModel() async {
    List<EntryModel> entries = [];

    List<FloorEntryModel?> floorEntries =
        await datasource.getAllAddedEntriesModel().first;

    if (floorEntries.isNotEmpty) {
      entries.addAll(
        floorEntries.map(
          (floor) => floorToEntryConverter.convert(floor!),
        ),
      );
    }

    return entries;
  }
}
