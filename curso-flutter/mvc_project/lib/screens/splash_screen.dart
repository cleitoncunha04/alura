// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mvc_project/routes/route_transitions.dart';
import 'package:mvc_project/screens/dashboard.dart';

import 'package:mvc_project/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double imageOpacity = 0.0;
  int millisecondsAnimationTime = 2000;

  waitAndShow() {
    Future.delayed(const Duration(milliseconds: 750)).then((_) {
      setState(() {
        imageOpacity = 1;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    waitAndShow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.modalBackgroundGradient[2],
      body: Center(
        child: Stack(
          children: [
            const _CustomAssetImage(
              path: 'assets/images/grimorio_1152.png',
            ),
            AnimatedOpacity(
              duration: Duration(
                milliseconds: millisecondsAnimationTime,
              ),
              opacity: imageOpacity,
              onEnd: () => Navigator.of(context).pushReplacement(
                sliderRouteTransition(
                  nextScreen: const Dashboard(),
                ),
              ),
              curve: Curves.easeInOut,
              child: const _CustomAssetImage(
                path: 'assets/images/grimorio_titulo_1152.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomAssetImage extends StatelessWidget {
  const _CustomAssetImage({
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Image.asset(
        path,
        width: 300,
      ),
    );
  }
}
