import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../supabase/set_initialize.dart';

part 'text_state.dart';

class TextCubit extends Cubit<TextState> {
  TextCubit() : super(TextInitial());

  TextEditingController controllerText = TextEditingController();
  List<Map<String, dynamic>> tableMap =
      List<Map<String, dynamic>>.empty(growable: true);

  void doSomething() async {
    emitLoading();
    await Future.delayed(Duration(seconds: 2));
    emitUpdate();
  }

  void changeLanguage({required BuildContext context}) async {
    emitLoading();
    if (context.locale == Locale('ar')) {
      await context.setLocale(Locale('en'));
    } else if (context.locale == Locale('en')) {
      await context.setLocale(Locale('ar'));
    }
    emitUpdate();
  }

  Future<void> fetchData() async {
    emitLoading();
    if (tableMap.isNotEmpty) {
      print('fghjkl');
    } else {
      var res =
          await SupabaseInitialize.supabase.from('messages').select().limit(2);
      for (var e in res) {
        tableMap.add(e);
      }
    }
    emitUpdate();
  }

  void emitLoading() => emit(LoadingState());
  void emitUpdate() => emit(UpdateUIState());
}
