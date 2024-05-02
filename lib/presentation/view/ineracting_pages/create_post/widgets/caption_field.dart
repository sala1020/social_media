import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/text_controllers/controllers.dart';

class CaptionField extends StatelessWidget {
  const CaptionField({
    super.key,
    required this.formKey,
  });
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Form(
        key: formKey,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: Controllers.captionController,
          cursorColor: Colors.black,
          maxLines: 10,
          style: const TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              hintText: 'Enter caption here.......',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: kBlack,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: kBlack,
                  width: 2.0,
                ),
              ),
              errorBorder:
                  const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              border: const OutlineInputBorder()),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Add Some Caption Here';
            }
            return null;
          },
        ),
      ),
    );
  }
}
