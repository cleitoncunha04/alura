import 'package:clean_arch_project/domain/entitiy/entry.dart';

abstract class HyruleRepository {
  Future<List<Entry>> findEntriesByCategory({required String category});
}
