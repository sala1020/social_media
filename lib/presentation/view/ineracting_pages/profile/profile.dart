import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/bio.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/button.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/section1.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ProfileSection1(),
            Bio(),
            ProfileButtons(),
            kHeight30,
            Text(
              'Post',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            kHeight10,
            Divider(
              color: Colors.black,
              endIndent: 20,
              indent: 20,
              thickness: 5,
            ),
            kHeight10,
            Expanded(child: Post())
          ],
        ),
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          crossAxisCount: 3,
          childAspectRatio: 19 / 19,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/profile1.png'),
              ),
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
