import 'package:flutter/material.dart';

kPushNavigation({required BuildContext context, required Widget page}) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => page,
  ));
}

kPushReplacemntNavigation(
    {required BuildContext context, required Widget page}) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => page,
  ));
}
