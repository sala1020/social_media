import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';

class PostShimmer extends StatelessWidget {
  const PostShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: kGrey,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            crossAxisCount: 3,
            childAspectRatio: 19 / 19,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        ),
      ),
    );
  }
}
