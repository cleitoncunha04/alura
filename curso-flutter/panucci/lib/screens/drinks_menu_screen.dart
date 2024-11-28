import 'package:flutter/material.dart';
import 'package:panucci/cardapio.dart';
import 'package:panucci/components/drink_item.dart';

class DrinksMenuScreen extends StatelessWidget {
  const DrinksMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = Cardapio.drinks;
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
                'Bebidas',
                style: TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => GridTile(
                child: DrinkItem(
                  imageURI: items[index]['image'],
                  itemTitle: items[index]['name'],
                  itemPrice: items[index]['price'],
                ),
              ),
              childCount: items.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: MediaQuery.of(context).orientation ==
                      Orientation.portrait
                  ? 158 / 174
                  : 1.18, // Proporção: crossAxis / mainAxis -> neste caso: width / height
            ),
          ),
        ],
      ),
    );
  }
}
