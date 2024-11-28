import 'package:flutter/material.dart';
import 'package:panucci/cardapio.dart';
import 'package:panucci/components/food_item.dart';

class FoodMenuScreen extends StatelessWidget {
  const FoodMenuScreen({super.key});

  final List<Map<String, dynamic>> items = Cardapio.comidas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        16,
        16,
        0,
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 16,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => FoodItem(
                itemTitle: items[index]['name'],
                itemPrice: items[index]['price'],
                imageURI: items[index]['image'],
              ),
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
