import 'package:flutter/material.dart';

mixin ScaleAnimationMixin<T extends StatefulWidget> on State<T> {
  late final AnimationController scaleAnimationController;
  late final Animation<double> scaleAnimation;

  TickerProvider get tickerProvider => this as TickerProvider;

  @override
  void initState() {
    super.initState();

    scaleAnimationController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(
        milliseconds: 1500,
      ),
    )..repeat(
        reverse: true,
      );

    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: scaleAnimationController,
      curve: Curves.easeInOutSine,
    );

    scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1,
    ).animate(
      curvedAnimation,
    );
  }

  @override
  void dispose() {
    scaleAnimationController.dispose();

    super.dispose();
  }
}
