import 'package:flutter/material.dart';
import 'package:package_arch_project/_core/constants/bytebank_colors.dart';
import 'package:package_arch_project/_core/widgets/height_margin.dart';
import 'package:package_arch_project/statement/widgets/transfer_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/transfer_model.dart';

class StatementTransfersListWidget extends StatelessWidget {
  final List<TransferModel> listTransfers;
  const StatementTransfersListWidget({super.key, required this.listTransfers});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: generateListSeparetedByMonth(),
        ),
      ),
    );
  }

  List<Widget> generateListSeparetedByMonth() {
    listTransfers.sort(
      (a, b) {
        return (a.date.isAfter(b.date)) ? 0 : 1;
      },
    );

    List<TransferModel> listTemp = listTransfers;

    List<Widget> widgets = [];

    while (listTemp.isNotEmpty) {
      int month = listTemp[0].date.month;

      widgets.add(
        Text(
          DateFormat("LLLL/yy", "pt_BR").format(listTemp[0].date),
          style: GoogleFonts.inter(
            fontSize: 16,
            color: BytebankColors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

      widgets.add(const HeightMargin(MarginType.small));

      listTemp
          .where((element) => element.date.month == month)
          .toList()
          .forEach((transfer) {
        widgets.add(TransferWidget(transfer: transfer));
      });

      listTemp.removeWhere((element) => element.date.month == month);

      widgets.add(const HeightMargin(MarginType.small));
    }

    return widgets;
  }
}
