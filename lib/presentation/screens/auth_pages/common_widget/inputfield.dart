import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/presentation/core/colors/colors.dart';
import 'package:social_media/presentation/core/fonts/fonts.dart';

class InputFieldAuth extends StatelessWidget {
  final String? hintText;
  final double? height;
  final double? width;
  final bool? isPassword;
  final TextAlign? textAlign;
  final TextInputType? inputType;
  const InputFieldAuth(
      {super.key,
      this.hintText,
      this.isPassword = false,
      this.height,
      this.width,
      this.textAlign,
      this.inputType});

  @override
  Widget build(BuildContext context) {
    int filledFields = 0;
    bool _obscureText = isPassword ?? false;
    return Form(
      child: Container(
        height: height ?? 66,
        width: width ?? 300,
        decoration: BoxDecoration(
          gradient: kInputFIeld,
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextFormField(
            keyboardType: inputType ?? TextInputType.emailAddress,
            textAlign: textAlign ?? TextAlign.start,
            cursorColor: kWhite,
            obscureText: _obscureText,
            style: const TextStyle(color: kWhite, fontSize: 20),
            onChanged: (value) {
              if (value.length <= 1) {
                FocusScope.of(context).nextFocus();
                filledFields++;
                print(filledFields);
              } else if (value.isEmpty) {
                FocusScope.of(context).previousFocus();
              }
            },
            decoration: InputDecoration(
              suffixIcon: isPassword!
                  ? IconButton(
                      onPressed: () {},
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility))
                  : null,
              hintText: hintText,
              hintStyle: GoogleFonts.inter(fontSize: 15, color: kGrey),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            inputFormatters: textAlign != null
                ? [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ]
                : []),
      ),
    );
  }
}
