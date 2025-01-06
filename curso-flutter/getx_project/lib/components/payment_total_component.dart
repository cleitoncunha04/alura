import 'package:flutter/material.dart';

class PaymentTotalComponent extends StatelessWidget {
  const PaymentTotalComponent({
    super.key,
    required this.total,
  });
  
  final String total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Total:",
                style: TextStyle(
                  color: Color(0xFF9D9D9D),
                ),
              ),
              Text(
                "R\$ $total",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
