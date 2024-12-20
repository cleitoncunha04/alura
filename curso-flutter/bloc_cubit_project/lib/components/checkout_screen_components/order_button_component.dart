import 'package:bloc_cubit_project/main.dart';
import 'package:flutter/material.dart';

class OrderButtonComponent extends StatelessWidget {
  const OrderButtonComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BilheteriaPanucci(),
          ),
          (route) => false,
        );
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.account_balance_wallet,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          Text(
            "Pedir",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          )
        ],
      ),
    );
  }
}
