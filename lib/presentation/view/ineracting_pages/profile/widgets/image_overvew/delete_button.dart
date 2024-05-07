// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/data/model/post_model/post_model.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/view/ineracting_pages/create_post/bloc/create_post_bloc.dart';

Future<dynamic> DeleteButtonWidget(BuildContext context, PostModel post) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return GestureDetector(
        onTap: () {
          context
              .read<CreatePostBloc>()
              .add(PostDeleteEvent(postID: post.postId.toString()));
          Navigator.pop(context);
          Navigator.pop(context);
        },
        child: SizedBox(
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const CupertinoListTile(
              padding: EdgeInsets.only(top: 15),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              title: Center(
                  child: Text(
                'Delete Post',
                style: TextStyle(color: kBlack, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
      );
    },
  );
}
