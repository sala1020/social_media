import 'package:flutter/material.dart';

class Section2 extends StatelessWidget {
  const Section2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Image.asset(
        'assets/splash/Splash.png',
        fit: BoxFit.cover,
      ),
    );
  }
}