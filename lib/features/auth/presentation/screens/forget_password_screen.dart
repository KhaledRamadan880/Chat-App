import 'package:chat_app/core/routes/routes.dart';
import 'package:chat_app/core/theme/theme.dart';
import 'package:chat_app/core/utils/app.images.dart';
import 'package:chat_app/core/utils/app_strings.dart';
import 'package:chat_app/core/utils/commons.dart';
import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 70.h),
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
              //! Email TextField
              const CustomTextField(
                hint: AppStrings.email,
                prefixIcon: Icons.email,
              ),
              SizedBox(height: 43.h),
              //! Send Button
              CustomButton(
                onPressed: () {
                  navigateReplacement(context: context, route: Routes.signIN);
                },
                child: Text(
                  AppStrings.send,
                  style: appTheme().textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
