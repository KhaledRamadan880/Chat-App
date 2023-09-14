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

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 70.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //! Header Texts
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.forgetpassword,
                      style: appTheme().textTheme.bodyMedium,
                    ),
                    Text(
                      AppStrings.enterEmail,
                      style: appTheme().textTheme.titleSmall,
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                //! Image
                SizedBox(
                  height: 300.h,
                  child: Image.asset(AppImages.onBoarding2),
                ),
                SizedBox(height: 56.h),
                //! Form
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is SendCodeSuccessState) {
                      toast(message: state.message, state: ToastStates.success);
                      navigateReplacement(
                          context: context, route: Routes.signIN);
                    }
                    if (state is SendCodeErrorState) {
                      toast(message: state.message, state: ToastStates.error);
                    }
                  },
                  builder: (context, state) {
                    final cubit = BlocProvider.of<AuthCubit>(context);
                    return Form(
                      key: cubit.resetPassKey,
                      child: Column(
                        children: [
                          //! Email TextField
                          CustomTextField(
                            controller: cubit.resetPassEmaiController,
                            hint: AppStrings.email,
                            prefixIcon: const Icon(Icons.email),
                            validator: (value) {
                              if (value!.isEmpty &&
                                  !value.contains('@gmail.com')) {}
                              return null;
                            },
                          ),
                          SizedBox(height: 43.h),
                          //! Send Button
                          CustomButton(
                            onPressed: () {
                              if (cubit.resetPassKey.currentState!.validate()) {
                                cubit.sendResetPassCode();
                              }
                            },
                            child: Text(
                              AppStrings.send,
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
    );
  }
}
