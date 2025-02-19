import 'package:flutter_listin/products/model/product.dart';
import 'package:hive/hive.dart';

/// [Box] é o nome dado pelo Hive onde as informações são guardadas (coleções)
class ProductsBoxHandler {
  late Box _box;


  Future<void> openBox({required String listinId}) async {
    _box = await Hive.openBox(listinId);
  }

  Future<void> closeBox() async {
    await _box.close();
  }


  /// Retorno é uma key autogerada pelo [Hive]
  Future<int> add(Product product) async {
    return await _box.add(product);
  }


  /// O método de leitura pode ser síncrono no [Hive]
  List<Product> findAll() {
    /// Só posso usar o "as Product" porque eu converti o Product como um [HiveType]
    return _box.values.map((element) => element as Product).toList();
  }

  Future<void> update(Product product) async {
    await product.save();
  }

  Future<void> remove(Product product) async {
    _box.delete(product.key);
  }
}