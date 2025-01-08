import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_project/components/custom_button_component.dart';
import 'package:getx_api_project/components/custom_field_component.dart';
import 'package:getx_api_project/controllers/user_controller.dart';
import 'package:getx_api_project/screens/login_screen.dart';
import 'package:getx_api_project/utils/colors_utils.dart';
import 'package:getx_api_project/utils/images_utils.dart';
import 'package:getx_api_project/utils/snackbars_utils.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController textUserController = TextEditingController();
  final TextEditingController textEmailController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();

  final UserConroller userController = Get.find<UserConroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.blueVoid,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Ink(
              decoration: BoxDecoration(
                color: ColorsUtils.primaryBlue,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Image.asset(
                        ImagesUtils.registerImage,
                        height: 160,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Image.asset(
                        ImagesUtils.logo,
                        height: 28,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        "Cadastro",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: ColorsUtils.blueAccent,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 32.0),
                      child: Text(
                        "Insira seus dados para criar sua conta.",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: CustomFieldComponent(
                        label: "Nome",
                        textController: textUserController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: CustomFieldComponent(
                        label: "Email",
                        textController: textEmailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: CustomFieldComponent(
                        label: "Senha",
                        textController: textPasswordController,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: CustomButtonComponent(
                            onTap: () {
                              userController
                                  .register(
                                user: textUserController.text,
                                email: textEmailController.text,
                                password: textPasswordController.text,
                              )
                                  .then(
                                (isCreated) {
                                  if (isCreated) {
                                    SnackbarsUtils.getConfirmRegistration(
                                      true,
                                    );

                                    textUserController.clear();

                                    textEmailController.clear();

                                    textPasswordController.clear();

                                    Get.offAll(
                                      () => LoginScreen(),
                                    );
                                  } else {
                                    SnackbarsUtils.getConfirmRegistration(
                                      false,
                                    );
                                  }
                                },
                              );
                            },
                            text: "Cadastrar",
                            icon: Icons.login,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        const Text(
                          "Já possui uma conta?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        TextButton(
                          onPressed: () => Get.offAll(
                            () => LoginScreen(),
                          ),
                          child: Text(
                            "Faça seu login!",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: ColorsUtils.blueAccent,
                              decorationColor: ColorsUtils.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
