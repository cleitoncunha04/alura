import 'package:flutter/material.dart';
import 'package:panucci/themes/app_colors.dart';

class HighlightItem extends StatelessWidget {
  const HighlightItem(
      {super.key,
      required this.imageURI,
      required this.itemTitle,
      required this.itemPrice,
      required this.itemDescription});
  final String imageURI;
  final String itemTitle;
  final String itemPrice;
  final String itemDescription;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      elevation: 1,
      child: Column(
        children: <Widget>[
          Image(
            width: double.infinity,
            height: 120,
            image: AssetImage(imageURI),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  itemTitle,
                  style: const TextStyle(fontSize: 16),
                ),
                Text("R\$ $itemPrice"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(itemDescription),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: AppColors.buttonStyle,
                    child: const Text('Pedir'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
