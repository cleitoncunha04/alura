import 'package:mobx/mobx.dart';
import 'package:mobx_project/store/cart_store.dart';

part 'item_store.g.dart';

// ignore: library_private_types_in_public_api
class ItemStore = _ItemStore with _$ItemStore;

abstract class _ItemStore with Store {
  final CartStore _cartStore; // Referência para o CartStore

  _ItemStore(this._cartStore) {
    reaction(
      (_) => _cartStore.isEmpty,
      (isEmpty) {
        if (isEmpty) {
          clear();
        }
      },
    );
  }

  @observable
  int _counterValue = 0;

  // Valor derivado, quando o _counterValue atualizar ele será atualizado também. O @computed é ideal para lógicas extras (regras de negócio)
  @computed
  int get counterValue => _counterValue;

  @action
  void add() {
    _counterValue++;
  }

  @action
  void remove() {
    if (_counterValue > 0) {
      _counterValue--;
    }
  }

  @action
  void clear() {
    _counterValue = 0;
  }
}
