import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/models/item_model.dart';

class SnackbarsUtils {
  SnackbarsUtils._();

  static GetSnackBar getSnackBarAddItem(ItemModel item) {
    return GetSnackBar(
      backgroundColor: Colors.green,
      title: 'Item adicionado!',
      message: '${item.nome} foi adicionado ao carrinho de compras...',
      icon: const Icon(
        Icons.check,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
  }

  static GetSnackBar getSnackBarRemoveItem(ItemModel item) {
    return GetSnackBar(
      backgroundColor: Colors.green,
      title: 'Item removido!',
      message: '${item.nome} foi removido do carrinho de compras...',
      icon: const Icon(
        Icons.check,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
  }

  static SnackbarController getPayment() {
    return Get.showSnackbar(
      const GetSnackBar(
        backgroundColor: Colors.green,
        title: 'Compra finalizada!',
        message: 'Seu pedido chegará em breve...',
        icon: Icon(
          Icons.check,
          color: Colors.white,
        ),
        shouldIconPulse: true,
        duration: Duration(
          milliseconds: 1000,
        ),
      ),
    );
  }
}
