import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/fonts/fonts.dart';
import 'package:social_media/presentation/view/animation/custom_ticker.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key,
    required this.heading,
  });

  final String heading;

  @override
  Widget build(BuildContext context) {
    final tickerProvider = CustomTickerProvider();
    final AnimationController animationController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        final offset = 8 * animationController.value;
        return Transform.translate(
            offset: Offset(0, offset),
            child: Text(
              heading,
              style: kAuthFont,
            ));
      },
    );
  }
}
