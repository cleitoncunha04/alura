import 'package:flutter/material.dart';

import '../../_core/constants/bytebank_colors.dart';
import '../helpers/decimal_text_formatter.dart';

class TransferAmountInputWidget extends StatelessWidget {
  final TextEditingController controller;
  const TransferAmountInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 144,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
        autofocus: true,
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
          signed: false,
        ),
        autocorrect: false,
        cursorColor: BytebankColors.green,
        enableSuggestions: false,
        smartDashesType: SmartDashesType.enabled,
        inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
        decoration: InputDecoration(
          prefixText: "R\$ ",
          hintText: "00,00",
          fillColor: BytebankColors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: BytebankColors.green,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: BytebankColors.green,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: BytebankColors.green,
              width: 4,
            ),
          ),
        ),
      ),
    );
  }
}
