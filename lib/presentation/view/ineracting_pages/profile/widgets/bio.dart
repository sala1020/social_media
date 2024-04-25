  
import 'package:flutter/material.dart';

class Bio extends StatelessWidget {
  const Bio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
          maxHeight: 110,
          minHeight: 20,
          maxWidth: double.infinity,
          minWidth: double.infinity),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 40),
            child: Text(
              'Salahudheen',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          Padding(
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
