import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/supabase/set_initialize.dart';
part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());

  TextEditingController searchController = TextEditingController();

  searchText({required TextEditingController controller}) {
    emitLoading();
    searchController = controller;
    emitUpdate();
  }

  getData() async {
    emitLoading();
    var userData = await SupabaseInitialize.supabase.from('users').select('id, name, orders(user_id, product_name)');
    print(userData);
    emitUpdate();

  }

  void emitLoading() => emit(LoadingState());
  void emitUpdate() => emit(UpdateUIState(search: searchController.text));
}
