
import 'package:flutter/material.dart';
import 'package:social_media/presentation/core/colors/colors.dart';

class GoogleAuth extends StatelessWidget {
  const GoogleAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        width: 130,
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset('assets/signin/google.jpg'),
            ),
            Text('Google'),
          ],
        ),
      ),
    );
  }
}
