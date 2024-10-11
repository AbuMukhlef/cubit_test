import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavInitial());

  goCubitTo({required BuildContext context, required Widget screenView}) {
    emitLoading();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => screenView));
    emitUpdate();
  }

  void emitLoading() => emit(LoadingState());
  void emitUpdate() => emit(UpdateUIState());
}
