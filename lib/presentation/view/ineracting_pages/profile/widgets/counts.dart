
import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/fonts/fonts.dart';

class Counts extends StatelessWidget {
  final String heading;
  final String count;
  const Counts({
    super.key,
    required this.heading,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              heading,
              style: kProfileCounts,
            ),
            Text(
              count,
              style: kProfileCounts,
            ),
          ],
        ),
      ),
    );
  }
}
