import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_nav_event.dart';
import 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(const BottomNavInitial(0)) {
    on<BottomNavTabChanged>((event, emit) {
      emit(BottomNavInitial(event.index));
    });
  }
}
