import 'package:your_ears_app/utils/images.dart';

class OnBoardingModel{
  String image;
  String title;
  String description;
  OnBoardingModel({required this.image,required this.title,required this.description});
}
List<OnBoardingModel> contents=[
  OnBoardingModel(
    title: 'Expert Care for your Ears',
    image: AppImages.onboardingImage,
    description: 'Get in touch with our clinic for expert advice and care tailored to your needs.Receive updates, reminders, and tips for maintaining ear health.'
  ),
  OnBoardingModel(
    title: 'Expert Care for your Ears',
    image: AppImages.onboardingImage,
    description: 'Get in touch with our clinic for expert advice and care tailored to your needs.Receive updates, reminders, and tips for maintaining ear health.'
  ),
  OnBoardingModel(
    title: 'Expert Care for your Ears',
    image: AppImages.onboardingImage,
    description: 'Get in touch with our clinic for expert advice and care tailored to your needs.Receive updates, reminders, and tips for maintaining ear health.'
  )
];