import 'package:mobx/mobx.dart';
import 'package:mobx_project/models/item_model.dart';

part 'cart_store.g.dart';

// ignore: library_private_types_in_public_api
class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  List<ItemModel> _items = ObservableList<ItemModel>();

  /** O @observable não percebe a mudança no conteúdo da lista se ela não for um ObservableList()*/
  @computed
  List<ItemModel> get items => _items;

  @computed
  int get itemsQuantity => _items.length;

  @action
  void add({required ItemModel item}) {
    _items.add(item);
  }

  @action
  bool remove({required ItemModel item}) {
    if (_items.contains(item)) {
      return _items.remove(item);
    }

    return false;
  }

  @action
  void clear() {
    if (!isEmpty) {
      _items.clear();
    }
  }

  @computed
  double get sumTotal =>
      _items.fold<double>(0.0, (acc, item) => acc + item.preco);

  @computed
  String get formattedTotal => sumTotal.toStringAsFixed(2).replaceAll('.', ',');

  @computed
  bool get isEmpty => _items.isEmpty;
}
