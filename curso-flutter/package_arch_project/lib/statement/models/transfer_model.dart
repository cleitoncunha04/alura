import 'package:package_arch_project/statement/models/transfer_types.dart';

class TransferModel {
  String id;
  TransferTypes type;
  double amount;
  DateTime date;

  TransferModel({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
  });
}
