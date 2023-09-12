import 'package:chat_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  //! Drop Icon Button
  String selectedItem = 'IT';
  List<String> department = ['IT', 'CS', 'IS', "AI"];
  void itemChange(value) {
    selectedItem = value;
    emit(ItemCahngedState());
  }

  //! Password Suffix
  bool isVisible = false;
  bool isobscure = true;
  eyeSuffixIcon() {
    return IconButton(
      onPressed: () {
        isVisible = !isVisible;
        isobscure = !isobscure;
        emit(IconChangedState());
      },
      icon: isVisible
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
    );
  }
}
