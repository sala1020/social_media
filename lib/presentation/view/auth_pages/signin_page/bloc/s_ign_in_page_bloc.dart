import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/data/services/auth_services/auth_service.dart';
import 'package:social_media/presentation/utils/functions/navigation.dart';
import 'package:social_media/presentation/view/ineracting_pages/bottomnav/bottom_nav.dart';

part 's_ign_in_page_event.dart';
part 's_ign_in_page_state.dart';

class SIgnInPageBloc extends Bloc<SIgnInPageEvent, SIgnInPageState> {
  SIgnInPageBloc() : super(SIgnInPageInitial()) {
    on<SignInDataEvent>((event, emit) async {
      final isSuccess = await AuthService.signIn(
          email: event.email, password: event.password);
      if (isSuccess == true) {
        // ignore: use_build_context_synchronously
        kPushandRemoveUntil(context: event.context, page: BottomNav());
      }
    });
  }
}
