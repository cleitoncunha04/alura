import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_api_project/screens/login_screen.dart';

void main() async {
  await GetStorage.init();

  runApp(const VidFlow());
}

class VidFlow extends StatelessWidget {
  const VidFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "VidFlow",
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blueAccent,
      ),
      defaultTransition: Transition.downToUp,
      home: LoginScreen(),
    );
  }
}
