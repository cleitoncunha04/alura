import 'package:get/get.dart';

class CartaoController extends GetxController {
  CartaoController({int initialValue = 0}) : _counter = initialValue.obs;

  RxInt _counter;

  RxInt get counter => _counter;

  /// Adiciona +1 no contador
  void increment() => _counter++;

  void decrement() => _counter--;
}
