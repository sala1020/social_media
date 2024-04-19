import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/view/auth_pages/signup_page/bloc/sign_up_page_bloc.dart';

class InputFieldAuth extends StatelessWidget {
  final String? hintText;
  final double? height;
  final double? width;
  final bool? isPassword;
  final TextAlign? textAlign;
  final TextInputType? inputType;
  final TextEditingController controller;
  final bool? isotp;

  const InputFieldAuth({
    super.key,
    this.hintText,
    this.isPassword = false,
    this.height,
    this.width,
    this.textAlign,
    this.inputType,
    required this.controller,
    this.isotp = false,
  });
  RegExp get emailRegExp => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    bool obscureText = isPassword ?? false;
    return Container(
      height: height ?? 66,
      width: width ?? 300,
      decoration: BoxDecoration(
        gradient: kInputFIeld,
        borderRadius: BorderRadius.circular(16),
      ),
      child: BlocBuilder<SignUpPageBloc, SignUpPageState>(
        builder: (context, state) {
          if (state is PasswordVisibilityState) {
            obscureText = state.obscureTextEmit;
          }
          return TextFormField(
              controller: controller,
              keyboardType: inputType ?? TextInputType.emailAddress,
              textAlign: textAlign ?? TextAlign.start,
              cursorColor: kWhite,
              obscureText: isPassword! ? obscureText : isPassword!,
              style: const TextStyle(color: kWhite, fontSize: 20),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'enter a value';
                }

                return null;
              },
              onChanged: (value) {
                if (isotp == true) {
                  if (value.length <= 1) {
                    FocusScope.of(context).nextFocus();
                  } else if (value.isEmpty) {
                    FocusScope.of(context).previousFocus();
                  }
                }
              },
              decoration: InputDecoration(
                suffixIcon: isPassword!
                    ? IconButton(
                        onPressed: () {
                          context.read<SignUpPageBloc>().add(
                              PasswordVisibilityEvent(
                                  obscureText: obscureText));
                          print('hello');
                        },
                        icon: Icon(obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        color: kWhite,
                      )
                    : null,
                hintText: hintText,
                hintStyle: GoogleFonts.inter(fontSize: 15, color: kGrey),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
              inputFormatters: textAlign != null
                  ? [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ]
                  : []);
        },
      ),
    );
  }
}
