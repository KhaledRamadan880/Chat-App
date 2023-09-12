import 'package:chat_app/core/theme/theme.dart';
import 'package:chat_app/core/utils/app.images.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/utils/app_strings.dart';
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
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      final authCubit = BlocProvider.of<AuthCubit>(context);
                      return Form(
                        child: Column(
                          children: [
                            //! Name TextField
                            const CustomTextField(
                              hint: AppStrings.name,
                              prefixIcon: Icons.person_outline_sharp,
                            ),
                            SizedBox(height: 30.h),
                            //! Phone Number TextField
                            const CustomTextField(
                              hint: AppStrings.phoneNum,
                              prefixIcon: Icons.phone,
                            ),
                            SizedBox(height: 30.h),
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
                            //! Sign Up Button0
                            CustomButton(
                              onPressed: () {},
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
