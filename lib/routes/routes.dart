part of 'routes_imports.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashScreenRoute.page, initial: true),
        AutoRoute(page: OnBoardingRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: BottomBarRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: ForgetScreenRoute.page),
        AutoRoute(page: OtpScreenRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: BookingsScreenRoute.page),
        AutoRoute(page: LoactionScreenRoute.page),
        AutoRoute(page: AboutAppScreenRoute.page),
        AutoRoute(page: BookingDetailsRoute.page),
        AutoRoute(page: CongratulationsScreenRoute.page),
      ];
}
