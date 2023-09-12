import 'package:chat_app/core/utils/app.images.dart';
import 'package:chat_app/core/utils/app_strings.dart';

class OnBoardingModel {
  final String title;
  final String subTitle;
  final String image;

  OnBoardingModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  static List<OnBoardingModel> onBoardingScreen = [
    OnBoardingModel(
      title: AppStrings.title1,
      subTitle: AppStrings.subTitle1,
      image: AppImages.onBoarding1,
    ),
    OnBoardingModel(
      title: AppStrings.title2,
      subTitle: AppStrings.subTitle2,
      image: AppImages.onBoarding2,
    ),
    OnBoardingModel(
      title: AppStrings.title3,
      subTitle: AppStrings.subTitle3,
      image: AppImages.onBoarding3,
    ),
  ];
}
