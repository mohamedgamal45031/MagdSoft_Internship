import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/end_points.dart';
import '../../data/remote/dio_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  bool showPass = true;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(GlobalLoading());

    DioHelper.postData(
      url: LOGIN,
      data:
      {
        'email': email,
        'password': password,
      },
    ).then((value)
    {

      emit(GlobalSuccess());
    }).catchError((error)
    {
      print(error.toString());
      emit(GlobalError(error.toString()));
    });
  }
  void ChangePasswordMode() {
    showPass = !showPass;
    emit(ShowPassword());
  }
}
