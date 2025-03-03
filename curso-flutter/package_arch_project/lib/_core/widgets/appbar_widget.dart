import 'package:flutter/material.dart';

AppBar getAppBarWidget() {
  return AppBar(
    // leading: const Icon(
    //   Icons.menu,
    //   size: 32,
    // ),
    title: Image.asset(
      "assets/logo-512.png",
      width: 145,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Image.asset("assets/avatar.png", width: 26),
      ),
    ],
  );
}
