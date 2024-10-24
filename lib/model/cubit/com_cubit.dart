import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'com_state.dart';

class ComCubit extends Cubit<ComState> {
  ComCubit() : super(ComInitial());



  void emitLoading () => emit(LoadingState());
  void emitUpdate () => emit(UpdateState());
}
