import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/presentation/view/home/bottomnav/cubit/cubit.dart';
import 'package:social_media/presentation/view/home/homepage/home_page.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final pages = [
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.abc),
          Icon(Icons.ac_unit),
          Icon(Icons.access_alarm),
          Icon(Icons.ac_unit),
          Icon(Icons.access_alarm)
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
