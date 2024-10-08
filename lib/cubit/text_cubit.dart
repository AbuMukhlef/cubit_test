import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_state.dart';

class TextCubit extends Cubit<TextState> {
  TextCubit() : super(TextInitial());

  var controllerText = TextEditingController();

  void doSomething() async {
    emitLoading();
    await Future.delayed(Duration(seconds: 2));
    emitUpdate();
  }

  void emitLoading() => emit(LoadingState());
  void emitUpdate() => emit(UpdateUIState());
}
