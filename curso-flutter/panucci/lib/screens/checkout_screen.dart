import 'package:flutter/material.dart';
import 'package:panucci/cardapio.dart';
import 'package:panucci/components/main_drawer.dart';
import 'package:panucci/components/order_item.dart';
import 'package:panucci/components/payment_method.dart';
import 'package:panucci/components/payment_total.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  final items = Cardapio.pedido;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ristorante Panucci"),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.account_circle,
              size: 32,
            ),
          )
        ],
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: _CheckoutContent(items: items),
    );
  }
}

class _CheckoutContent extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const _CheckoutContent({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: <Widget>[
          const TextTitleToSliver(text: 'Pedido:'),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => OrderItem(
                imageURI: items[index]['image'],
                itemTitle: items[index]['name'],
                itemPrice: items[index]['price'],
              ),
              childCount: items.length,
            ),
          ),
          const TextTitleToSliver(
            text: 'Pagamento:',
          ),
          const SliverToBoxAdapter(
            child: PaymentMethod(),
          ),
          const TextTitleToSliver(text: 'Confirmar:'),
          const SliverToBoxAdapter(
            child: PaymentTotal(),
          ),
        ],
      ),
    );
  }
}

class TextTitleToSliver extends StatelessWidget {
  final String text;

  const TextTitleToSliver({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
