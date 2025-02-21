import 'package:clean_arch_project/data/converter/converter.dart';
import 'package:clean_arch_project/data/database/floor/model/floor_entry_model.dart';
import 'package:clean_arch_project/data/model/entry_model.dart';

class FloorEntryModelConverterToEntryModel
    implements Converter<FloorEntryModel, EntryModel> {
  @override
  EntryModel convert(FloorEntryModel source) {
    return EntryModel(
      id: source.id,
      name: source.name,
      image: source.image,
      description: source.description,
      commonLocactions: source.commonLocactions,
      category: source.category,
    );
  }
}
