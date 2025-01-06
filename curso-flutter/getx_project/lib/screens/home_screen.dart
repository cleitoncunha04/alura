import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/components/cartao/controllers/cart_controller.dart';
import 'package:getx_project/components/categoria_text_component.dart';
import 'package:getx_project/components/item_list_component.dart';
import 'package:getx_project/components/search_input_component.dart';
import 'package:getx_project/screens/checkout_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchTextController = TextEditingController();

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SearchInputComponent(
                searchTextController: searchTextController,
              ),
            ),
            const SliverToBoxAdapter(
              child: CategoriaTextComponent(
                titulo: "Mais comprados",
              ),
            ),
            const SliverToBoxAdapter(
              child: ItemListComponent(
                categoria: "mais comprados",
              ),
            ),
            const SliverToBoxAdapter(
              child: CategoriaTextComponent(
                titulo: "Para o almoço",
              ),
            ),
            const SliverToBoxAdapter(
              child: ItemListComponent(
                categoria: "para o almoço",
              ),
            ),
            const SliverToBoxAdapter(
              child: CategoriaTextComponent(
                titulo: "Para dividir",
              ),
            ),
            const SliverToBoxAdapter(
              child: ItemListComponent(
                categoria: "para dividir",
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < -10) {
                    Get.to(
                      () => CheckoutScreen(),
                    );
                  }
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {},
                    child: Ink(
                      width: double.infinity,
                      height: 70,
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        8,
                        16,
                        8,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: Colors.white,
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Obx(
                                        () => Text(
                                          '${cartController.items.isNotEmpty && cartController.items.length < 10 ? "0${cartController.items.length}" : cartController.items.length}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.shopping_basket_outlined,
                                      size: 24,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    )
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Ver carrinho",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Obx(
                                  () => Text(
                                    "R\$ ${cartController.formattedTotal}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
