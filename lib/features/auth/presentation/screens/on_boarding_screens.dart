import 'package:chat_app/core/database/cache/cache.dart';
import 'package:chat_app/core/database/services/service_locator.dart';
import 'package:chat_app/core/routes/routes.dart';
import 'package:chat_app/core/theme/theme.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/utils/app_strings.dart';
import 'package:chat_app/core/utils/commons.dart';
import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/features/auth/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreens extends StatelessWidget {
  OnBoardingScreens({super.key});

  final PageController dotsController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: PageView.builder(
            controller: dotsController,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
                child: Column(
                  children: [
                    //! Skip Button
                    index == 2
                        ? SizedBox(height: 70.h)
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  dotsController.jumpToPage(2);
                                },
                                style: TextButton.styleFrom(
                                  fixedSize: Size(double.infinity, 15.h),
                                ),
                                child: Text(
                                  AppStrings.skip,
                                  style: appTheme().textTheme.titleSmall,
                                ),
                              ),
                            ],
                          ),
                    SizedBox(height: 20.h),

                    //! Image
                    SizedBox(
                      height: 300.h,
                      child: Image.asset(
                        OnBoardingModel.onBoardingScreen[index].image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 48.h),

                    //! Title
                    Text(
                      OnBoardingModel.onBoardingScreen[index].title,
                      style: appTheme().textTheme.titleLarge,
                    ),
                    //! Sub Title
                    Text(
                      OnBoardingModel.onBoardingScreen[index].subTitle,
                      style: appTheme().textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40.h),

                    //! Dots
                    SmoothPageIndicator(
                      controller: dotsController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: AppColors.primary,
                        dotColor: AppColors.grey,
                        // dotWidth: 10,
                        dotHeight: 5,
                        spacing: 5,
                      ),
                    ),
                    const Spacer(),

                    //! Back & Next Buttons
                    Row(
                      children: [
                        //! Back Button
                        index == 1
                            ? CustomButton(
                                onPressed: () {
                                  dotsController.jumpTo(0);
                                },
                                width: 60.w,
                                child: const Icon(
                                  Icons.arrow_back_outlined,
                                  color: AppColors.white,
                                ),
                              )
                            : Container(),
                        const Spacer(),
                        //! Next Button
                        index != 2
                            ? CustomButton(
                                onPressed: () {
                                  dotsController.jumpToPage(index + 1);
                                },
                                width: 125.w,
                                child: const Text(AppStrings.next),
                              )
                            : Container(),
                      ],
                    ),
                    //! Start Button
                    index == 2
                        ? CustomButton(
                            onPressed: () async {
                              await serviceLocator<Cache>()
                                  .setdata(key: 'isStarted', value: true)
                                  .then(
                                (value) {
                                  navigateReplacement(
                                      context: context, route: Routes.signIN);
                                },
                              );
                            },
                            width: 380.w,
                            child: const Text(AppStrings.next),
                          )
                        : Container(),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
