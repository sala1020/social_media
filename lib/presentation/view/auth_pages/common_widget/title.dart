import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:social_media/presentation/utils/fonts/fonts.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key,
    required this.heading,
  });

  final String heading;

  @override
  Widget build(BuildContext context) {
    final tickerProvider = _CustomTickerProvider();
    final AnimationController animationController = AnimationController(
      vsync: tickerProvider,
      duration: Duration(milliseconds: 700),
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

class _CustomTickerProvider implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
