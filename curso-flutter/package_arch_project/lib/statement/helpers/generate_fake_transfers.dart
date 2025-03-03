import 'dart:math';

import 'package:package_arch_project/statement/models/transfer_model.dart';
import 'package:package_arch_project/statement/models/transfer_types.dart';

List<TransferModel> generateFakeTransfers(
    {required double countTransfers, required int pastDays}) {
  List<TransferModel> result = [];

  for (int i = 0; i < countTransfers; i++) {
    result.add(
      TransferModel(
        id: "TF$i",
        type: _randomTransferTypes(),
        amount: Random().nextDouble() * 2000,
        date: DateTime.now().subtract(
          Duration(
            days: Random().nextInt(pastDays),
          ),
        ),
      ),
    );
  }

  return result;
}

TransferTypes _randomTransferTypes() {
  List<TransferTypes> list = [
    TransferTypes.deposit,
    TransferTypes.recived,
    TransferTypes.sended,
    TransferTypes.withdrawal,
  ];
  return list[Random().nextInt(list.length)];
}
