import 'package:clean_arch_project/data/model/entry_model.dart';
import 'package:clean_arch_project/domain/entitiy/entry.dart';
import 'package:clean_arch_project/domain/repository/hyrule_repository.dart';
import 'package:clean_arch_project/utils/consts/api_url.dart';
import 'package:dio/dio.dart';

class HyruleRepositoryImpl extends HyruleRepository {
  final Dio _dio = Dio();

  @override
  Future<List<Entry>> findEntriesByCategory({required String category}) async {
    List<Entry> entries = [];

    Response response = await _dio.get('${ApiUrl.baseUrl}$category');

    if (response.statusCode == 200) {
      entries = List<EntryModel>.from(
        response.data['data'].map(
          (e) => EntryModel.fromMap(e),
        ),
      );
    }

    return entries;
  }
}
