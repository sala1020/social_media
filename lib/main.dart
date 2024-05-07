import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media/data/shared_preference/shared_preference.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/view/auth_pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:social_media/presentation/view/auth_pages/forgot_password/reset_passord/bloc/reset_password_bloc.dart';
import 'package:social_media/presentation/view/auth_pages/signin_page/bloc/s_ign_in_page_bloc.dart';
import 'package:social_media/presentation/view/auth_pages/signup_otp.dart/bloc/signup_otp_bloc.dart';
import 'package:social_media/presentation/view/auth_pages/signup_page/bloc/sign_up_page_bloc.dart';

import 'package:social_media/presentation/view/auth_pages/splash/splash.dart';
import 'package:social_media/presentation/view/ineracting_pages/bottomnav/bottom_nav.dart';
import 'package:social_media/presentation/view/ineracting_pages/bottomnav/cubit/cubit.dart';
import 'package:social_media/presentation/view/ineracting_pages/create_post/bloc/create_post_bloc.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/bloc/profile_bloc.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    isLoggedIn: await SharedPreferencesHelper.isLoggedIn() ?? false,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpPageBloc()),
        BlocProvider(create: (context) => SignupOtpBloc()),
        BlocProvider(create: (context) => NavIndex()),
        BlocProvider(create: (context) => SIgnInPageBloc()),
        BlocProvider(create: (context) => ForgotPasswordBloc()),
        BlocProvider(create: (context) => ResetPasswordBloc()),
        BlocProvider(create: (context) => CreatePostBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 0, 0, 0), background: kBg),
          useMaterial3: true,
        ),
        home: isLoggedIn ? BottomNav() : const Splash(),
      ),
    );
  }
}
