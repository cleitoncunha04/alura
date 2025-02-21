import 'package:clean_arch_project/utils/consts/routes_enum.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    required this.isCenter,
  });

  final String text;
  final bool isCenter;

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
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              RoutesEnum.favorites.route,
            );
          },
          icon: const Icon(Icons.favorite),
        ),
      ],
    );
  }
}
