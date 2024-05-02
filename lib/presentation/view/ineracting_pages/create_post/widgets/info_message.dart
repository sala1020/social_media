import 'package:flutter/material.dart';

class InfoMessage extends StatelessWidget {
  const InfoMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.send_to_mobile_rounded,
          size: 80,
        ),
        Text(
          'Select Post',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
