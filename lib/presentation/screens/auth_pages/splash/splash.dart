import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:social_media/presentation/core/colors/colors.dart';

import 'package:social_media/presentation/screens/auth_pages/splash/widgets/section1.dart';
import 'package:social_media/presentation/screens/auth_pages/splash/widgets/section3.dart';

import 'widgets/section2.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: bg),
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
