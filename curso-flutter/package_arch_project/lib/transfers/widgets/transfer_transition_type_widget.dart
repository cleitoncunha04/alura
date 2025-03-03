import 'package:flutter/material.dart';
import 'package:package_arch_project/_core/constants/bytebank_transfers_types.dart';

import '../../_core/constants/bytebank_colors.dart';

class TransferTransitionTypeWidget extends StatelessWidget {
  final BytebankTransfersType? transferType;
  final Function onChanged;
  const TransferTransitionTypeWidget({
    super.key,
    required this.transferType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: BytebankColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BytebankColors.green, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: DropdownButton(
          isExpanded: true,
          underline: Container(),
          iconEnabledColor: BytebankColors.green,
          value: transferType,
          hint: const Text("Selecione o tipo de transação"),
          items: const [
            DropdownMenuItem(
              value: BytebankTransfersType.pix,
              child: Text("PIX"),
            ),
            DropdownMenuItem(
              value: BytebankTransfersType.ted,
              child: Text("TED"),
            ),
            DropdownMenuItem(
              value: BytebankTransfersType.doc,
              child: Text("DOC"),
            ),
          ],
          onChanged: (value) {
            onChanged(value);
          },
        ),
      ),
    );
  }
}
