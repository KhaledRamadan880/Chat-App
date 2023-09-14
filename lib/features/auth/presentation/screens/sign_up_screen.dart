import 'package:chat_app/core/routes/routes.dart';
import 'package:chat_app/core/theme/theme.dart';
import 'package:chat_app/core/utils/app.images.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/utils/app_strings.dart';
import 'package:chat_app/core/utils/commons.dart';
import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/core/widgets/custom_text_field.dart';
import 'package:chat_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //! Image
                  SizedBox(
                      height: 300.h,
                      child: Image.asset(
                        AppImages.sign,
                      )),
                  SizedBox(height: 23.h),
                  //! Form
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is SignUpSuccesState) {
                        toast(
                            message: state.message, state: ToastStates.success);
                        navigateReplacement(
                            context: context, route: Routes.signIN);
                      }
                      if (state is SignUpErrorState) {
                        toast(message: state.message, state: ToastStates.error);
                      }
                    },
                    builder: (context, state) {
                      final authCubit = BlocProvider.of<AuthCubit>(context);
                      return Form(
                        key: authCubit.signUpKey,
                        child: Column(
                          children: [
                            //! Name TextField
                            CustomTextField(
                              controller: authCubit.signUpNameController,
                              hint: AppStrings.name,
                              prefixIcon:
                                  const Icon(Icons.person_outline_sharp),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Valid Name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: 30.h),
                            //! Phone Number TextField
                            CustomTextField(
                              controller: authCubit.signUpPhoneController,
                              hint: AppStrings.phoneNum,
                              prefixIcon: const Icon(Icons.phone),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Valid Phone Number';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: 30.h),
                            //! Email TextField
                            CustomTextField(
                              controller: authCubit.signUpEmaiController,
                              hint: AppStrings.email,
                              prefixIcon: const Icon(Icons.mail),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Valid Email';
                                } else {
                                  return null;
                                }
                              },
                              // showSuffix: false,
                            ),
                            SizedBox(height: 30.h),
                            //! Password TextField
                            CustomTextField(
                              controller: authCubit.signUpPassController,
                              hint: AppStrings.password,
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: authCubit.eyeSuffixIcon(),
                              isObscure: authCubit.isobscure,
                              showSuffix: true,
                              validator: (value) {
                                if (value!.length <= 6) {
                                  return 'Please Enter Valid Password';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: 30.h),
                            //! Department
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.grey,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButton(
                                icon: const Icon(
                                  Icons.arrow_circle_down_rounded,
                                  color: AppColors.primary,
                                ),
                                underline: Container(),
                                hint: Text(authCubit.selectedItem),
                                isExpanded: true,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                items: authCubit.department
                                    .map((e) => DropdownMenuItem(
                                        value: e, child: Text(e)))
                                    .toList(),
                                onChanged: (value) {
                                  authCubit.itemChange(value);
                                },
                              ),
                            ),
                            SizedBox(height: 30.h),
                            //! Sign Up Button
                            state is SignUpLoadingState
                                ? const CircularProgressIndicator()
                                : CustomButton(
                                    onPressed: () {
                                      if (authCubit.signUpKey.currentState!
                                          .validate()) {
                                        authCubit.signUp();
                                      }
                                    },
                                    child: Text(
                                      AppStrings.signUp,
                                      style: appTheme().textTheme.bodySmall,
                                    ),
                                  ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
