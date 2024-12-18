// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on _CartStore, Store {
  Computed<List<ItemModel>>? _$itemsComputed;

  @override
  List<ItemModel> get items =>
      (_$itemsComputed ??= Computed<List<ItemModel>>(() => super.items,
              name: '_CartStore.items'))
          .value;
  Computed<int>? _$itemsQuantityComputed;

  @override
  int get itemsQuantity =>
      (_$itemsQuantityComputed ??= Computed<int>(() => super.itemsQuantity,
              name: '_CartStore.itemsQuantity'))
          .value;
  Computed<double>? _$sumTotalComputed;

  @override
  double get sumTotal => (_$sumTotalComputed ??=
          Computed<double>(() => super.sumTotal, name: '_CartStore.sumTotal'))
      .value;
  Computed<String>? _$formattedTotalComputed;

  @override
  String get formattedTotal =>
      (_$formattedTotalComputed ??= Computed<String>(() => super.formattedTotal,
              name: '_CartStore.formattedTotal'))
          .value;
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??=
          Computed<bool>(() => super.isEmpty, name: '_CartStore.isEmpty'))
      .value;

  late final _$_itemsAtom = Atom(name: '_CartStore._items', context: context);

  @override
  List<ItemModel> get _items {
    _$_itemsAtom.reportRead();
    return super._items;
  }

  @override
  set _items(List<ItemModel> value) {
    _$_itemsAtom.reportWrite(value, super._items, () {
      super._items = value;
    });
  }

  late final _$_CartStoreActionController =
      ActionController(name: '_CartStore', context: context);

  @override
  void add({required ItemModel item}) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.add');
    try {
      return super.add(item: item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool remove({required ItemModel item}) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.remove');
    try {
      return super.remove(item: item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
itemsQuantity: ${itemsQuantity},
sumTotal: ${sumTotal},
formattedTotal: ${formattedTotal},
isEmpty: ${isEmpty}
    ''';
  }
}
