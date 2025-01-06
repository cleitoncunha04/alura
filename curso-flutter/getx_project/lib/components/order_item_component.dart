import 'package:flutter/material.dart';
import 'package:getx_project/models/item_model.dart';

class OrderItemComponent extends StatelessWidget {
  const OrderItemComponent({
    super.key,
    required this.item,
  });

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              image: AssetImage(
                item.uri,
              ),
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
                    item.preco.toStringAsFixed(2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
