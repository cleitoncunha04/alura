import 'package:flutter/material.dart';
import 'package:panucci/cardapio.dart';
import 'package:panucci/components/highlight_item.dart';

class HighlightsScreen extends StatelessWidget {
  const HighlightsScreen({super.key});

  final List<Map<String, dynamic>> items = Cardapio.destaques;

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
                'Destaques',
                style: TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ), // O Sliver só aceita Widgets do tipo Sliver, por isso preciso fazer esse "parse" com o SliverToBoxAdapter()
          MediaQuery.of(context).orientation == Orientation.portrait
              ? _PortraitList(items: items)
              : _LandscapeList(items: items),
        ],
      ),
    );
  }
}

class _LandscapeList extends StatelessWidget {
  const _LandscapeList({
    required this.items,
  });

  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => HighlightItem(
          imageURI: items[index]['image'],
          itemTitle: items[index]['name'],
          itemPrice: items[index]['price'],
          itemDescription: items[index]['description'],
        ),
        childCount: items.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.08,
      ),
    );
  }
}

class _PortraitList extends StatelessWidget {
  const _PortraitList({
    required this.items,
  });

  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => HighlightItem(
          imageURI: items[index]['image'],
          itemTitle: items[index]['name'],
          itemPrice: items[index]['price'],
          itemDescription: items[index]['description'],
        ),
        childCount: items.length,
      ),
    );
  }
}
