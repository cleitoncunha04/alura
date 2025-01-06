import 'package:get/get.dart';
import 'package:getx_project/models/item_model.dart';

class CartController extends GetxController {
  final RxList<ItemModel> _items = <ItemModel>[].obs;

  RxList<ItemModel> get items => _items;

  void add(ItemModel item) {
    _items.add(item);
  }

  void remove(ItemModel item) {
    if (items.contains(item)) {
      _items.remove(item);
    }
  }

  RxDouble get sumTotal =>
      _items.fold<double>(0.0, (acc, item) => acc + item.preco).obs;

  RxString get formattedTotal => sumTotal.toStringAsFixed(2).replaceAll('.', ',').obs;
}
