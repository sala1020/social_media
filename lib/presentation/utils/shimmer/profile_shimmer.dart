import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/shimmer/post_shimmer.dart';
import 'package:social_media/presentation/utils/size/heights.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        enabled: true,
        baseColor: Colors.grey.shade200,
        highlightColor: kGrey,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(110),
                  bottomRight: Radius.circular(80),
                ),
              ),
            ),
            kHeight90,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: kBlack,
                  ),
                ),
                Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: kBlack,
                  ),
                ),
              ],
            ),
            kHeight30,
            const Divider(
              endIndent: 23,
              indent: 30,
            ),
            kHeight90,
            Expanded(
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
          ],
        ));
  }
}
