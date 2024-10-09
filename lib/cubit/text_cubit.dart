import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../supabase/set_initialize.dart';

part 'text_state.dart';

class TextCubit extends Cubit<TextState> {
  TextCubit() : super(TextInitial());

  TextEditingController controllerText = TextEditingController();
  List<Map<String, dynamic>> tableMap = List<Map<String, dynamic>>.empty(growable: true);

  void doSomething() async {
    emitLoading();
    await Future.delayed(Duration(seconds: 2));
    emitUpdate();
  }

  Future<void> fetchData() async {
    emitLoading();
    var res = await SupabaseInitialize.supabase.from('messages').select().limit(2);
    res.forEach((e) => tableMap.add(e));
    emitUpdate();
  }

  void emitLoading() => emit(LoadingState());
  void emitUpdate() => emit(UpdateUIState());
}
