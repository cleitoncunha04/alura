import 'package:flutter/material.dart';
import 'package:package_arch_project/_core/constants/bytebank_colors.dart';
import 'package:package_arch_project/_core/constants/bytebank_routes.dart';
import 'package:package_arch_project/_core/constants/bytebank_screens.dart';

Widget getDrawerWidget({
  required BuildContext context,
  required BytebankScreens screen,
}) {
  return Container(
    margin: EdgeInsets.only(
      top: 75,
    ),
    child: Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 300,
        width: 200,
        color: BytebankColors.lightgrey,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      BytebankRoutes.home,
                    );
                  },
                  child: Text(
                    "Início",
                    style: _getDrawerTextStyle(
                      currentScreen: screen,
                      currentButton: BytebankScreens.home,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.0,
                  ),
                  child: Divider(color: BytebankColors.black),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      BytebankRoutes.transfers,
                    );
                  },
                  child: Text(
                    "Transferências",
                    style: _getDrawerTextStyle(
                      currentScreen: screen,
                      currentButton: BytebankScreens.transfers,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.0,
                  ),
                  child: Divider(color: BytebankColors.black),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      BytebankRoutes.statement,
                    );
                  },
                  child: Text(
                    "Extrato",
                    style: _getDrawerTextStyle(
                      currentScreen: screen,
                      currentButton: BytebankScreens.statement,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.0,
                  ),
                  child: Divider(color: BytebankColors.black),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Outros serviços",
                    style: _getDrawerTextStyle(
                      currentScreen: screen,
                      currentButton: BytebankScreens.others,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: BytebankColors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

TextStyle _getDrawerTextStyle({
  required BytebankScreens currentScreen,
  required BytebankScreens currentButton,
}) {
  return TextStyle(
    fontSize: 18,
    color: (currentScreen == currentButton)
        ? BytebankColors.green
        : BytebankColors.black,
    fontWeight:
        (currentScreen == currentButton) ? FontWeight.bold : FontWeight.w400,
  );
}
