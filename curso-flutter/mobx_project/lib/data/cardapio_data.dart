import 'package:mobx_project/models/item_model.dart';

class CardapioData {
  CardapioData._();

  static const String _imageInitialPath = "assets/images";

  static const List<ItemModel> todosOsItemModels = <ItemModel>[
    ItemModel(
      "Chicken Salad",
      "mais comprados",
      58.90,
      "$_imageInitialPath/chicken-salad.png",
    ),
    ItemModel(
      "Chicken Tender",
      "mais comprados",
      49.90,
      "$_imageInitialPath/chicken-tender.png",
    ),
    ItemModel(
      "Cold Noodles",
      "para o almoço",
      37.50,
      "$_imageInitialPath/cold-noodles.png",
    ),
    ItemModel(
      "Hamburger Ink",
      "para o almoço",
      48.50,
      "$_imageInitialPath/hamburger-ink.png",
    ),
    ItemModel(
      "Lasagna",
      "para dividir",
      55.00,
      "$_imageInitialPath/lasagna-bolognese.jpg",
    ),
    ItemModel(
      "Shrimp 'n rice",
      "para dividir",
      68.50,
      "$_imageInitialPath/shrimp-n-rice.png",
    ),
    ItemModel(
      "Chicken Tortilla",
      "mais comprados",
      35.50,
      "$_imageInitialPath/chicken-tortilla.png",
    ),
    ItemModel(
      "Coxinhas",
      "mais comprados",
      15.00,
      "$_imageInitialPath/coxinhas.png",
    ),
    ItemModel(
      "Fish 'n Salsa",
      "mais comprados",
      45.50,
      "$_imageInitialPath/fish-n-salsa.png",
    ),
    ItemModel(
      "Pamonha",
      "para o almoço",
      10.00,
      "$_imageInitialPath/pamonha.png",
    ),
    ItemModel(
      "Penne au sugo",
      "para o almoço",
      25.00,
      "$_imageInitialPath/penne-au-sugo.png",
    ),
    ItemModel(
      "Rice 'n Beans",
      "para dividir",
      35.00,
      "$_imageInitialPath/rice-n-beans.jpg",
    ),
    ItemModel(
      "Spagetti",
      "para dividir",
      20.00,
      "$_imageInitialPath/spagetti.png",
    ),
    ItemModel(
      "Steak Veggies",
      "mais comprados",
      68.00,
      "$_imageInitialPath/steak-veggies.png",
    ),
    ItemModel(
      "Tapioca Taco",
      "mais comprados",
      25.00,
      "$_imageInitialPath/tapioca-taco.jpg",
    ),
  ];
}
