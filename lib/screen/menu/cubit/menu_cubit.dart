import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());

  TextEditingController searchController = TextEditingController();

  searchText({required TextEditingController controller}) {
    emitLoading();
    searchController = controller;
    emitUpdate();
  }

  void emitLoading() => emit(LoadingState());
  void emitUpdate() => emit(UpdateUIState(search: searchController.text));
}
