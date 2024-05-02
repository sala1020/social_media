import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class _CustomTickerProvider implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final tickerProvider = _CustomTickerProvider();
    final AnimationController animationController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);

    return SizedBox(
      height: 150,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
           final offset = 8 * animationController.value;
          return Transform.translate(
            offset: Offset(0, offset),
            child: Image.asset(
              'assets/splash/Splash.png',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
