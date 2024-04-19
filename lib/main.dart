import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/presentation/view/auth_pages/signup_otp.dart/bloc/signup_otp_bloc.dart';
import 'package:social_media/presentation/view/auth_pages/signup_page/bloc/sign_up_page_bloc.dart';

import 'package:social_media/presentation/view/auth_pages/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpPageBloc()),
            BlocProvider(create: (context) => SignupOtpBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255),
          ),
          useMaterial3: true,
        ),
        home: const Splash(),
      ),
    );
  }
}
