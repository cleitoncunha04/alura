import 'package:bytebank_balance/bytebank_balance.dart';
import 'package:flutter/material.dart';
import 'package:package_arch_project/_core/constants/bytebank_colors.dart';
import 'package:package_arch_project/_core/widgets/height_margin.dart';
import 'package:package_arch_project/statement/helpers/generate_fake_transfers.dart';
import 'package:package_arch_project/statement/models/transfer_model.dart';
import 'package:package_arch_project/statement/widgets/statement_background_widget.dart';
import 'package:package_arch_project/statement/widgets/statement_title_widget.dart';
import 'package:package_arch_project/statement/widgets/statement_transfers_list_widget.dart';

import '../../_core/constants/bytebank_screens.dart';
import '../../_core/widgets/appbar_widget.dart';
import '../../_core/widgets/drawer_widget.dart';

class StatementPage extends StatefulWidget {
  const StatementPage({super.key});

  @override
  State<StatementPage> createState() => _StatementPageState();
}

class _StatementPageState extends State<StatementPage> {
  List<TransferModel> listTransfers = [];

  @override
  void initState() {
    listTransfers = generateFakeTransfers(countTransfers: 30, pastDays: 400);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(),
      drawer: getDrawerWidget(
        context: context,
        screen: BytebankScreens.statement,
      ),
      body: StatementBackgroundWidget(
        children: [
          const StatementTitleWidget(),
          const HeightMargin(MarginType.large),
          BytebankBalance(
            userId: "ID001",
            color: BytebankColors.black,
          ),
          const HeightMargin(MarginType.large),
          StatementTransfersListWidget(listTransfers: listTransfers),
        ],
      ),
    );
  }
}
