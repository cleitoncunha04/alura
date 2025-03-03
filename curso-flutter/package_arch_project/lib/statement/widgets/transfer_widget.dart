import 'package:flutter/material.dart';
import 'package:package_arch_project/_core/constants/bytebank_colors.dart';
import 'package:package_arch_project/_core/widgets/height_margin.dart';
import 'package:package_arch_project/statement/models/transfer_model.dart';
import 'package:package_arch_project/statement/models/transfer_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransferWidget extends StatelessWidget {
  final TransferModel transfer;
  const TransferWidget({super.key, required this.transfer});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _defineTextByType(transfer.type),
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                  fontSize: 16,
                ),
              ),
              Text(
                "${_definePositivityByType(transfer.type)}R\$ ${transfer.amount.toStringAsFixed(2)}",
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const HeightMargin(MarginType.tiny),
              const Divider(
                color: BytebankColors.green,
                thickness: 1,
              ),
              const HeightMargin(MarginType.tiny),
            ],
          ),
        ),
        Flexible(
          flex: 4,
          child: Text(
            DateFormat("dd/MM/yyyy").format(transfer.date),
            textAlign: TextAlign.end,
            style: GoogleFonts.inter(fontSize: 13, color: BytebankColors.grey),
          ),
        ),
      ],
    );
  }

  String _definePositivityByType(TransferTypes type) {
    switch (type) {
      case TransferTypes.recived:
        {
          return "+ ";
        }
      case TransferTypes.sended:
        {
          return "- ";
        }
      case TransferTypes.deposit:
        {
          return "+ ";
        }
      case TransferTypes.withdrawal:
        {
          return "- ";
        }
    }
  }

  String _defineTextByType(TransferTypes type) {
    switch (type) {
      case TransferTypes.recived:
        {
          return "Recebimento";
        }
      case TransferTypes.sended:
        {
          return "Transferência";
        }
      case TransferTypes.deposit:
        {
          return "Depósito";
        }
      case TransferTypes.withdrawal:
        {
          return "Saque";
        }
    }
  }
}
