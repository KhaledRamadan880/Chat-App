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
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final authCubit = BlocProvider.of<AuthCubit>(context);
                    return Form(
                      child: Column(
                        children: [
                          //! Email TextField
                          const CustomTextField(
                            hint: AppStrings.email,
                            prefixIcon: Icons.mail,
                            // showSuffix: false,
                          ),
                          SizedBox(height: 30.h),
                          //! Password TextField
                          CustomTextField(
                            hint: AppStrings.password,
                            prefixIcon: Icons.lock_outline,
                            suffixIcon: authCubit.eyeSuffixIcon(),
                            isObscure: authCubit.isobscure,
                            showSuffix: true,
                          ),
                          //! Forget Password Text Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  navigateNamed(
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
                          CustomButton(
                            onPressed: () {},
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
                                  navigateNamed(
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
