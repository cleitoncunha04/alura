import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobx_project/models/item_model.dart';
import 'package:mobx_project/store/cart_store.dart';
import 'package:provider/provider.dart';

class OrderItemComponent extends StatelessWidget {
  const OrderItemComponent({
    super.key,
    required this.item,
    required this.homeContext,
  });

  final ItemModel item;

  final BuildContext homeContext;

  @override
  Widget build(BuildContext context) {
    final CartStore cartStore =
        Provider.of<CartStore>(homeContext, listen: false);

    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.2,
        children: [
          SlidableAction(
            onPressed: (_) {
              cartStore.remove(item: item);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image(
                width: 42,
                height: 42,
                image: AssetImage(item.uri),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8.0,
                      ),
                      child: Text(
                        item.nome,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      'R\$ ${item.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
