import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/components/cartao/controllers/cart_controller.dart';
import 'package:getx_project/components/order_item_component.dart';
import 'package:getx_project/components/payment_method_component.dart';
import 'package:getx_project/components/payment_total_component.dart';
import 'package:getx_project/screens/home_screen.dart';
import 'package:getx_project/utils/snackbars_utils.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 5) {
          Get.back();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomScrollView(
              slivers: <Widget>[
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 8.0,
                    ),
                    child: Text(
                      "Pedido",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => OrderItemComponent(
                      item: cartController.items[index],
                    ),
                    childCount: cartController.items.length,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 8.0,
                    ),
                    child: Text(
                      "Pagamento",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
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
                      total: cartController.formattedTotal.value),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(
                          () => HomeScreen(),
                        );

                        SnackbarsUtils.getPayment();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        foregroundColor: Colors.white,
                        backgroundColor:
                            Theme.of(context).colorScheme.surfaceTint,
                      ),
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
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
