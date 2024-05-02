import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/utils/text_controllers/controllers.dart';
import 'package:social_media/presentation/view/ineracting_pages/create_post/bloc/create_post_bloc.dart';
import 'package:social_media/presentation/view/ineracting_pages/create_post/widgets/bg_container.dart';
import 'package:social_media/presentation/view/ineracting_pages/create_post/widgets/caption_field.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/button.dart';

class AfterImageSelection extends StatelessWidget {
  AfterImageSelection({
    super.key,
    required this.selectedMedia,
  });

  final String selectedMedia;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 10),
              child: NormalButton(
                buttonName: 'Post',
                height: 40,
                width: 90,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<CreatePostBloc>().add(PutPostEvent(
                        context: context,
                        caption: Controllers.captionController.text,
                        mediaUrl: selectedMedia));

                    Controllers.captionController.clear();
                  }
                },
              ),
            ),
          ),
          kHeight10,
          kHeight10,
          GestureDetector(
            onTap: () {
              context.read<CreatePostBloc>().add(SelectImageEvent());
            },
            child: BgContainer(
              imageUrl: selectedMedia,
            ),
          ),
          kHeight30,
          CaptionField(
            formKey: formKey,
          )
        ],
      ),
    );
  }
}
