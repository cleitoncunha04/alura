import 'package:clean_arch_project/utils/consts/my_themes.dart';
import 'package:flutter/material.dart';

mixin ColorAnimationMixin<T extends StatefulWidget> on State<T> {
  late final AnimationController colorAnimationController;
  late final Animation<Color?> colorAnimation;

  TickerProvider get tickerProvider => this as TickerProvider;

  @override
  void initState() {
    super.initState();

    colorAnimationController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(
        milliseconds: 1500,
      ),
    )..repeat(
        reverse: true,
      );

    colorAnimation = ColorTween(
      begin: ThemeColors.wrapBorderColor,
      end: ThemeColors.iconColor,
    ).animate(
      CurvedAnimation(
        parent: colorAnimationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    colorAnimationController.dispose();

    super.dispose();
  }
}
