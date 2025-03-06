import 'package:flutter/material.dart';

Route sliderRouteTransition({
  required Widget nextScreen,
  Duration duration = const Duration(
    milliseconds: 1500,
  ),
  Curve curve = Curves.easeOutCubic,
  Offset beginPositon = const Offset(0, 2),
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Animatable<Offset> tween = Tween(
        begin: beginPositon,
        end: Offset.zero,
      ).chain(
        CurveTween(
          curve: curve,
        ),
      );

      return SlideTransition(
        position: animation.drive(
          tween,
        ),
        child: nextScreen,
      );
    },
  );
}
