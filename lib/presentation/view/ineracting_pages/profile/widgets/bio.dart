import 'package:flutter/material.dart';
import 'package:social_media/data/model/profile_model/profile_model.dart';

class Bio extends StatelessWidget {
  final UserProfile details;
  const Bio({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
          maxHeight: 110,
          minHeight: 20,
          maxWidth: double.infinity,
          minWidth: double.infinity),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 40),
            child: Text(
              details.username,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 40),
            child: Text(
              'Hi How Are You?\nNothing Special😉',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
