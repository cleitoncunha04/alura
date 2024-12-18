import 'package:flutter/material.dart';
import 'package:mobx_project/components/cartao_component.dart';
import 'package:mobx_project/data/cardapio_data.dart';
import 'package:mobx_project/models/item_model.dart';

class ItemListComponent extends StatelessWidget {
  const ItemListComponent({
    super.key,
    required this.categoria,
  });

  final String categoria;
  final List<ItemModel> cardapio = CardapioData.todosOsItemModels;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 32.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 150),
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (cardapio[index].categoria == categoria) {
              return CartaoComponent(item: cardapio[index]);
            } else {
              return Container();
            }
          },
          scrollDirection: Axis.horizontal,
          itemCount: cardapio.length,
        ),
      ),
    );
  }
}
