import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/view/ineracting_pages/bottomnav/cubit/cubit.dart';
import 'package:social_media/presentation/view/ineracting_pages/conversation/conversation.dart';
import 'package:social_media/presentation/view/ineracting_pages/create_post/new_post.dart';
import 'package:social_media/presentation/view/ineracting_pages/homepage/home_page.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/profile.dart';
import 'package:social_media/presentation/view/ineracting_pages/search_page/search.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final pages = [
    const HomePage(),
    const Search(),
    const NewPost(),
    const Conversation(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: kBg,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        color: Colors.black,
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.create,
            color: Colors.white,
          ),
          Icon(
            Icons.chat,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          )
        ],
        onTap: (value) {
          context.read<NavIndex>().updateIndex(value);
        },
      ),
      body: BlocBuilder<NavIndex, int>(
        builder: (context, selectedIndex) {
          return pages[selectedIndex];
        },
      ),
    );
  }
}
