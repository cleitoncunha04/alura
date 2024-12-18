import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_project/components/categoria_text_component.dart';
import 'package:mobx_project/components/item_list_component.dart';
import 'package:mobx_project/components/search_input_component.dart';
import 'package:mobx_project/screens/checkout_screen.dart';
import 'package:mobx_project/store/cart_store.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CartStore cartStore = Provider.of<CartStore>(context, listen: false);

    final BuildContext homeContext = context;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SearchInputComponent(
                  searchTextController: searchTextController),
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
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Observer(
                  builder: (_) => !cartStore.isEmpty
                      ? InkWell(
                          onTap: () {
                            // O Provider da CheckoutScreen precisa receber o contexto do BuildContext da HomeScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutScreen(
                                  homeContext: homeContext,
                                ),
                              ),
                            );
                          },
                          child: Ink(
                            width: double.infinity,
                            height: 80,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surfaceTint,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          "${cartStore.itemsQuantity}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "R\$ ${cartStore.formattedTotal}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
