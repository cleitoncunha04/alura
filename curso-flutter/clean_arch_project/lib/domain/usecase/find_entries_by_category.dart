import 'package:clean_arch_project/domain/entitiy/entry.dart';
import 'package:clean_arch_project/domain/repository/hyrule_repository.dart';
import 'package:clean_arch_project/domain/usecase/usecase.dart';

class FindEntriesByCategory
    implements UseCase<List<Entry>, ParamsFindEntriesByCategory> {
  FindEntriesByCategory({required HyruleRepository hyruleRepository})
      : _hyruleRepository = hyruleRepository;

  final HyruleRepository _hyruleRepository;

  @override
  Future<List<Entry>> call(ParamsFindEntriesByCategory params) async =>
      await _hyruleRepository.findEntriesByCategory(
        category: params.category,
      );
}

class ParamsFindEntriesByCategory {
  ParamsFindEntriesByCategory({
    required this.category,
  });

  final String category;
}
