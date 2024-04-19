import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:social_media/data/services/auth_services/auth_service.dart';
import 'package:social_media/presentation/utils/functions/navigation.dart';
import 'package:social_media/presentation/view/home/bottomnav/bottom_nav.dart';

part 's_ign_in_page_event.dart';
part 's_ign_in_page_state.dart';

class SIgnInPageBloc extends Bloc<SIgnInPageEvent, SIgnInPageState> {
  SIgnInPageBloc() : super(SIgnInPageInitial()) {
    on<SignInDataEvent>((event, emit) async {
      final isSuccess = await AuthService.signIn(
          email: event.email, password: event.password);
      if (isSuccess == true) {
        kPushandRemoveUntil(context: event.context, page: BottomNav());
      }
    });
  }
}
