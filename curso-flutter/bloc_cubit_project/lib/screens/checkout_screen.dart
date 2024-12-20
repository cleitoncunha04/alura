import 'package:bloc_cubit_project/components/checkout_screen_components/order_button_component.dart';
import 'package:bloc_cubit_project/components/checkout_screen_components/order_details_component.dart';
import 'package:bloc_cubit_project/components/checkout_screen_components/payment_method_component.dart';
import 'package:bloc_cubit_project/components/checkout_screen_components/payment_total_component.dart';
import 'package:bloc_cubit_project/models/movie_model.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    super.key,
    required this.movie,
    required this.session,
  });

  final MovieModel movie;

  final String session;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
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
              OrderDetailsComponent(
                movie: movie,
                session: session,
              ),
              const Padding(
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
              const PaymentMethodComponent(),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 8.0,
                ),
                child: Text(
                  "Confirmar total",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const PaymentTotalComponent(
                total: 32,
              ),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    OrderButtonComponent(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
