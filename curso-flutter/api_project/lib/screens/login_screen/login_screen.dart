import 'package:api_project/models/user.dart';
import 'package:api_project/screens/common/confirmation_dialog.dart';
import 'package:api_project/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  AuthService authService = AuthService();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    login() async {
      User user = User(
        email: widget._emailController.text,
        password: widget._passwordController.text,
      );

      try {
        await widget.authService.signIn(user);
      } on UserNotFindedExecption {
        showConfirmationDialog(
          context,
          title: 'User not exists',
          content: 'Should register this user?',
        ).then((value) async => value != null && value
            ? await widget.authService.signUp(user)
            : null);
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Form(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Icon(
                    Icons.bookmark,
                    size: 64,
                    color: Colors.grey[700],
                  ),
                  const Text(
                    "Journal Notes",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text("by Cleiton Cunha",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  const Text("Sign in or Sign up"),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: widget._emailController,
                      decoration: InputDecoration(
                        label: const Text(
                          "Email...",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suffixIcon: const Icon(
                          Icons.email,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: widget._passwordController,
                      decoration: InputDecoration(
                          label: const Text(
                            "Password...",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              isPasswordVisible = !isPasswordVisible;
                              setState(() {});
                            },
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          )),
                      keyboardType: TextInputType.visiblePassword,
                      maxLength: 16,
                      obscureText: !isPasswordVisible,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const SizedBox(
                      width: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
