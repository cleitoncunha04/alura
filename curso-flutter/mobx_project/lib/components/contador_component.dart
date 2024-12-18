import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_project/models/item_model.dart';
import 'package:mobx_project/store/cart_store.dart';
import 'package:mobx_project/store/item_store.dart';
import 'package:provider/provider.dart';

class ContadorComponent extends StatelessWidget {
  ContadorComponent({
    super.key,
    required this.item,
  });

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    final CartStore cartStore = Provider.of<CartStore>(context, listen: false);

    final ItemStore itemStore = ItemStore(cartStore);

    return Observer(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              itemStore.remove();

              cartStore.remove(item: item);
            },
            child: const Icon(
              Icons.remove_circle_outline,
              size: 20,
            ),
          ),
          Text(
            itemStore.counterValue.toString(),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              itemStore.add();

              cartStore.add(item: item);
            },
            child: const Icon(
              Icons.add_circle_outline,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
