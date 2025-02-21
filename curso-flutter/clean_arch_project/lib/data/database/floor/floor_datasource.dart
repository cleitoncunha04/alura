import 'package:clean_arch_project/data/database/floor/model/floor_entry_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class FloorDatasource {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveEntryModel(FloorEntryModel entry);

  @Query('DELETE FROM FloorEntryModel WHERE id = :id')
  Future<void> deleteEntryModel(int id);

  @Query('SELECT * FROM FloorEntryModel')
  Stream<List<FloorEntryModel?>> getAllAddedEntriesModel();
}
