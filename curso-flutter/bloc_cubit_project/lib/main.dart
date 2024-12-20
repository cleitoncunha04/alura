import 'package:bloc_cubit_project/logic/cubit/my_themes_cubit.dart';
import 'package:bloc_cubit_project/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BilheteriaPanucci());
}

class BilheteriaPanucci extends StatelessWidget {
  const BilheteriaPanucci({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyThemeCubit(),
      child: BlocBuilder<MyThemeCubit, ThemeData>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bilheteria Panucci',
          theme: state,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
