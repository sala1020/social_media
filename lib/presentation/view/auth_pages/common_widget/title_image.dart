import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class _CustomTickerProvider implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

class TitleImage extends StatelessWidget {
  final double? height;
  final double? width;
  const TitleImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final tickerProvider = _CustomTickerProvider();
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
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
