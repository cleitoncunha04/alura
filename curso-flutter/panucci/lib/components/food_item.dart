import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  const FoodItem(
      {super.key,
      required this.itemTitle,
      required this.itemPrice,
      required this.imageURI});
  final String itemTitle;
  final String itemPrice;
  final String imageURI;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    itemTitle,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text("R\$ $itemPrice"),
                ],
              ),
            ),
            Image(
              image: AssetImage(imageURI),
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
