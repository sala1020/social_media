import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:social_media/presentation/view/auth_pages/splash/widgets/section1.dart';
import 'package:social_media/presentation/view/auth_pages/splash/widgets/section3.dart';

import 'widgets/section2.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xffC2D8D3)),
        child: Animate(
          effects: [
            FadeEffect(
              duration: 1000.ms,
            ),
            FadeEffect(
              duration: 1000.ms,
            )
          ],
          child: const Column(
            children: [
              Section1(),
              Section2(),
              Section3(),
            ],
          ),
        ),
      ),
    );
  }
}
