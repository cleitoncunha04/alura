import 'package:clean_arch_project/utils/consts/routes_enum.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    required this.text,
    required this.isCenter,
    this.isFavorite = false,
    this.isDetails = false,
    this.isList = false,
    this.isCardView = false,
    this.changeListView,
  });

  final String text;
  final bool isCenter;
  final bool isFavorite;
  final bool isDetails;
  final bool isList;
  bool isCardView;
  final void Function()? changeListView;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      centerTitle: isCenter,
      actions: <Widget>[
        if (!isFavorite && !isDetails)
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                RoutesEnum.entries.route,
                arguments: {'isFavorite': true}
              );
            },
            icon: const Icon(
              Icons.favorite,
            ),
          ),
        if (isList)
          IconButton(
            onPressed: () => changeListView!(),
            icon: Icon(!isCardView ? Icons.line_weight_sharp : Icons.list),
          ),
      ],
    );
  }
}
