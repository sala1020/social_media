import 'package:flutter/cupertino.dart';
import 'package:social_media/presentation/utils/functions/navigation.dart';
import 'package:social_media/presentation/view/auth_pages/splash/splash.dart';

class IconMore extends StatelessWidget {
  const IconMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 10),
        child: CupertinoButton(
          onPressed: () {
            kPushNavigation(context: context, page: Splash());
          },
          child: const Icon(
            CupertinoIcons.text_justify,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 35,
            weight: 50,
            grade: 50,
          ),
        ),
      ),
    );
  }
}
