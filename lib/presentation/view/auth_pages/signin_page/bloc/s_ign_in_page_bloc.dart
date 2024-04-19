import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 's_ign_in_page_event.dart';
part 's_ign_in_page_state.dart';

class SIgnInPageBloc extends Bloc<SIgnInPageEvent, SIgnInPageState> {
  SIgnInPageBloc() : super(SIgnInPageInitial()) {
    on<SIgnInPageEvent>((event, emit) {});
  }
}
