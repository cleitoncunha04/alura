import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/components/cartao/controllers/cart_controller.dart';
import 'package:getx_project/components/cartao/controllers/cartao_controller.dart';
import 'package:getx_project/models/item_model.dart';
import 'package:getx_project/screens/home_screen.dart';
import 'package:getx_project/utils/snackbars_utils.dart';

class CartaoComponent extends StatefulWidget {
  const CartaoComponent({
    super.key,
    required this.item,
  });

  final ItemModel item;

  @override
  State<CartaoComponent> createState() => _CartaoComponentState();
}

class _CartaoComponentState extends State<CartaoComponent> {
  /// Inicialização atrasada.
  /// Instância do [Controller], passando uma tag que serve como um [ID].
  /// Por padrão, o [GetX] não cria outra instancia para cada elemento de uma lista, mas sim reutiliza o seu próprio.
  /// Daí temos essa [tag], que permite essa manipulação indivual de cada item.
  late CartaoController cartaoController;

  /// [Get.find] busca por uma instância já criada de [CartController], neste caso a instância que foi criada na [HomeScreen]
  final CartController cartController = Get.find<CartController>();

  @override
  void initState() {
    cartaoController = Get.put(
      CartaoController(),
      tag: widget.item.nome,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF6F6F6),
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 134,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage(
                widget.item.uri,
              ),
              width: double.infinity,
              height: 50,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                    ),
                    child: Text(
                      widget.item.nome,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "R\$ ${widget.item.preco.toStringAsFixed(2)}",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          /// Tive que tirar a lógica dentro do [Controller] do GetX para que o SnackBar só seja exibido quando o item for realmente removido 
                          if (cartaoController.counter > 0) {
                            cartaoController.decrement();

                            cartController.remove(widget.item);

                            Get.showSnackbar(
                              SnackbarsUtils.getSnackBarRemoveItem(
                                widget.item,
                              ),
                            );
                          }
                        },
                        child: const Icon(
                          Icons.remove_circle_outline,
                          size: 20,
                        ),
                      ),
                      Obx(
                        () => Text(
                          cartaoController.counter.toString(),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          cartaoController.increment();

                          cartController.add(widget.item);

                          Get.showSnackbar(
                            SnackbarsUtils.getSnackBarAddItem(
                              widget.item,
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.add_circle_outline,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
