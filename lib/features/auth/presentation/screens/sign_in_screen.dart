import 'package:chat_app/core/routes/routes.dart';
import 'package:chat_app/core/theme/theme.dart';
import 'package:chat_app/core/utils/app.images.dart';
import 'package:chat_app/core/utils/app_strings.dart';
import 'package:chat_app/core/utils/commons.dart';
import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/core/widgets/custom_text_field.dart';
import 'package:chat_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //! Image
                Image.asset(
                  AppImages.sign,
                  height: 300.h,
                ),
                SizedBox(height: 70.h),

                //! Form
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      toast(message: state.message, state: ToastStates.success);
                      navigateReplacement(context: context, route: Routes.chat);
                    }
                    if (state is LoginErrorState) {
                      toast(message: state.message, state: ToastStates.error);
                    }
                  },
                  builder: (context, state) {
                    final authCubit = BlocProvider.of<AuthCubit>(context);
                    return Form(
                      key: authCubit.loginKey,
                      child: Column(
                        children: [
                          //! Email TextField
                          CustomTextField(
                            controller: authCubit.loginEmailController,
                            hint: AppStrings.email,
                            prefixIcon: const Icon(Icons.mail),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Valid Email';
                              }
                              // if (!value.contains('@gmail.com')) {
                              //   return 'Please Enter Valid Email';
                              // }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.h),
                          //! Password TextField
                          CustomTextField(
                            controller: authCubit.loginPassController,
                            hint: AppStrings.password,
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: authCubit.eyeSuffixIcon(),
                            isObscure: authCubit.isobscure,
                            showSuffix: true,
                            validator: (value) {
                              if (value!.length <= 6) {
                                return 'Please Enter Valid Password';
                              }
                              return null;
                            },
                          ),
                          //! Forget Password Text Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  navigateReplacement(
                                      context: context,
                                      route: Routes.forgetPass);
                                },
                                child: Text(
                                  AppStrings.forgetpassword,
                                  style: appTheme().textTheme.titleSmall,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 47.h),
                          //! Sign in Button
                          state is LoginLoadingState
                              ? const CircularProgressIndicator()
                              : CustomButton(
                                  onPressed: () {
                                    if (authCubit.loginKey.currentState!
                                        .validate()) {
                                      authCubit.login();
                                    }
                                  },
                                  child: Text(
                                    AppStrings.signIn,
                                    style: appTheme().textTheme.bodySmall,
                                  ),
                                ),
                          //! Sign up
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.dontHaveEmail,
                                style: appTheme().textTheme.titleSmall,
                              ),
                              TextButton(
                                onPressed: () {
                                  navigateReplacement(
                                      context: context, route: Routes.signUp);
                                },
                                child: const Text(AppStrings.signUp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
