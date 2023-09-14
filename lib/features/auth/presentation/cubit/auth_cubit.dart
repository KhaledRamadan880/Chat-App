import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/auth/data/repository/auth_repo.dart';
import 'package:chat_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  //! Login Method
  UserModel? userModel;
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  void login() async {
    emit(LoginLoadingState());
    var res = await authRepo.login(
      email: loginEmailController.text,
      password: loginPassController.text,
    );
    res.fold(
      (l) => emit(LoginErrorState(l)),
      (r) {
        userModel = r;
        emit(LoginSuccessState(r.name));
      },
    );
  }

  //! Sign Up Method
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpPhoneController = TextEditingController();
  TextEditingController signUpEmaiController = TextEditingController();
  TextEditingController signUpPassController = TextEditingController();
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  void signUp() async {
    emit(SignUpLoadingState());
    final res = await authRepo.signUp(
      email: signUpEmaiController.text,
      password: signUpPassController.text,
      name: signUpNameController.text,
      phone: signUpPhoneController.text,
      department: selectedItem,
    );
    res.fold(
      (l) => emit(SignUpErrorState(l)),
      (r) => emit(SignUpSuccesState(r)),
    );
  }

  //! Reset Passord Send Code Method
  TextEditingController resetPassEmaiController = TextEditingController();
  GlobalKey<FormState> resetPassKey = GlobalKey<FormState>();
  void sendResetPassCode() async {
    emit(SendCodeLoadingState());
    final res = await authRepo.resetPass(email: resetPassEmaiController.text);
    res.fold(
      (l) => emit(SendCodeErrorState(l)),
      (r) => emit(SendCodeSuccessState(r)),
    );
  }

  //! Drop Icon Button
  String selectedItem = 'Department';
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
