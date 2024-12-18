// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemStore on _ItemStore, Store {
  Computed<int>? _$counterValueComputed;

  @override
  int get counterValue =>
      (_$counterValueComputed ??= Computed<int>(() => super.counterValue,
              name: '_ItemStore.counterValue'))
          .value;

  late final _$_counterValueAtom =
      Atom(name: '_ItemStore._counterValue', context: context);

  @override
  int get _counterValue {
    _$_counterValueAtom.reportRead();
    return super._counterValue;
  }

  @override
  set _counterValue(int value) {
    _$_counterValueAtom.reportWrite(value, super._counterValue, () {
      super._counterValue = value;
    });
  }

  late final _$_ItemStoreActionController =
      ActionController(name: '_ItemStore', context: context);

  @override
  void add() {
    final _$actionInfo =
        _$_ItemStoreActionController.startAction(name: '_ItemStore.add');
    try {
      return super.add();
    } finally {
      _$_ItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove() {
    final _$actionInfo =
        _$_ItemStoreActionController.startAction(name: '_ItemStore.remove');
    try {
      return super.remove();
    } finally {
      _$_ItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counterValue: ${counterValue}
    ''';
  }
}
