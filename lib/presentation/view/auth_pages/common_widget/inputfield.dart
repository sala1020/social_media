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
  final RegExp? regx;
  final String? emptyMessage;
  final String? validateMessage;

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
    this.regx,
    this.emptyMessage,
    this.validateMessage,
  });

  @override
  Widget build(BuildContext context) {
    bool obscureText = isPassword ?? false;
    return BlocBuilder<SignUpPageBloc, SignUpPageState>(
      builder: (context, state) {
        if (state is PasswordVisibilityState) {
          obscureText = state.obscureTextEmit;
        }
        return Padding(
          padding: const EdgeInsets.only(right: 40, left: 40),
          child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              keyboardType: inputType ?? TextInputType.emailAddress,
              textAlign: textAlign ?? TextAlign.start,
              cursorColor: kWhite,
              obscureText: isPassword! ? obscureText : isPassword!,
              style: GoogleFonts.reemKufi(color: kBlack, fontSize: 22),
              validator: (value) {
                if (isotp == false) {
                  if (value!.isEmpty) {
                    return "This Field is Empty";
                  } else if (regx != null && !regx!.hasMatch(value)) {
                    return validateMessage;
                  }
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
                filled: true,
                fillColor: Color.fromARGB(77, 27, 27, 27),
                errorStyle: const TextStyle(
                  fontSize: 10,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
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
                hintStyle: GoogleFonts.inter(fontSize: 17, color: kBlack),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)),
              ),
              inputFormatters: textAlign != null
                  ? [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ]
                  : []),
        );
      },
    );
  }
}
