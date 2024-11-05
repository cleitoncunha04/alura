import 'package:api_project/models/account_model.dart';

class SenderNotExistsException implements Exception {
  String message;

  SenderNotExistsException({this.message = 'Sender does not exists'});
}

class ReceiverNotExistsException implements Exception {
  String message; 

  ReceiverNotExistsException({this.message = 'Receiver does not exists'});
}

class InsufficientAmountException implements Exception {
  String message;
  Account cause;
  double amount;
  double taxes;

  InsufficientAmountException(
      {this.message = 'Insufficient amount',
      required this.cause,
      required this.amount,
      required this.taxes});
}
