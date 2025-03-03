import 'package:flutter/material.dart';

import '../../_core/constants/bytebank_colors.dart';

class TransferSendButtonWidget extends StatelessWidget {
  final Function onPressed;
  const TransferSendButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: const Text(
        "Concluir transação",
        style: TextStyle(
          color: BytebankColors.white,
        ),
      ),
    );
  }
}
