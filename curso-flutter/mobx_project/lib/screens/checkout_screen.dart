import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_project/components/order_item_component.dart';
import 'package:mobx_project/components/payment_method_component.dart';
import 'package:mobx_project/components/payment_total_component.dart';
import 'package:mobx_project/store/cart_store.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    super.key,
    required this.homeContext,
  });

  final BuildContext homeContext;

  @override
  Widget build(BuildContext context) {
    final CartStore cartStore =
        Provider.of<CartStore>(homeContext, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Observer(
            builder: (_) => CustomScrollView(
              slivers: <Widget>[
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Pedido",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                !cartStore.isEmpty
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (_, index) => OrderItemComponent(
                                  item: cartStore.items[index],
                                  homeContext: homeContext,
                                ),
                            childCount: cartStore.itemsQuantity),
                      )
                    : const SliverToBoxAdapter(),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Pagamento",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: PaymentMethodComponent(),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 8.0,
                    ),
                    child: Text(
                      "Confirmar",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: PaymentTotalComponent(
                    total: cartStore.sumTotal,
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          cartStore.clear();

                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            foregroundColor: Colors.white,
                            backgroundColor:
                                Theme.of(context).colorScheme.surfaceTint),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 8.0,
                                ),
                                child: Icon(
                                  Icons.account_balance_wallet,
                                ),
                              ),
                              Text(
                                "Pedir",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ]),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
