import 'package:bytebank_balance/bytebank_balance.dart';
import 'package:flutter/material.dart';
import 'package:package_arch_project/_core/constants/bytebank_colors.dart';
import 'package:package_arch_project/_core/constants/bytebank_transfers_types.dart';
import 'package:package_arch_project/_core/widgets/height_margin.dart';
import 'package:package_arch_project/transfers/widgets/transfer_amount_input_widget.dart';
import 'package:package_arch_project/transfers/widgets/transfer_background_widget.dart';
import 'package:package_arch_project/transfers/widgets/transfer_send_button_widget.dart';
import 'package:package_arch_project/transfers/widgets/transfer_title_widget.dart';
import 'package:package_arch_project/transfers/widgets/transfer_transition_type_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_core/constants/bytebank_screens.dart';
import '../../_core/widgets/appbar_widget.dart';
import '../../_core/widgets/drawer_widget.dart';

class TransfersPage extends StatefulWidget {
  const TransfersPage({super.key});
  @override
  State<TransfersPage> createState() => _TransfersPageState();
}

class _TransfersPageState extends State<TransfersPage> {
  BytebankTransfersType? transferType;
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(),
      drawer: getDrawerWidget(
        context: context,
        screen: BytebankScreens.transfers,
      ),
      resizeToAvoidBottomInset: false, // Teclado sobrepoe conteúdo
      body: TransferBackgroundWidget(
        children: [
          const TransferTitleWidget(),
          const HeightMargin(MarginType.large),
          BytebankBalance(
            userId: "ID001",
            color: BytebankColors.black,
          ),
          const HeightMargin(MarginType.large),
          TransferTransitionTypeWidget(
            transferType: transferType,
            onChanged: (value) {
              setState(
                () {
                  transferType = value;
                },
              );
            },
          ),
          const HeightMargin(MarginType.large),
          Text(
            "Valor",
            style: GoogleFonts.inter(
              color: BytebankColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const HeightMargin(MarginType.small),
          TransferAmountInputWidget(controller: _amountController),
          const HeightMargin(MarginType.large),
          TransferSendButtonWidget(onPressed: () {}),
        ],
      ),
    );
  }
}
