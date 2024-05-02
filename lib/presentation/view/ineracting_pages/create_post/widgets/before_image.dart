
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/presentation/view/ineracting_pages/create_post/bloc/create_post_bloc.dart';
import 'package:social_media/presentation/view/ineracting_pages/create_post/widgets/bg_container.dart';
import 'package:social_media/presentation/view/ineracting_pages/create_post/widgets/info_message.dart';

class BeforeImageSelection extends StatelessWidget {
  const BeforeImageSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.read<CreatePostBloc>().add(SelectImageEvent());
        },
        child: const Stack(
          alignment: Alignment.center,
          children: [
            BgContainer(),
            InfoMessage(),
          ],
        ),
      );
  }
}
