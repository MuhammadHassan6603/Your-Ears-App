// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:your_ears_app/pages/about/presentation/screen/about_screen.dart'
    as _i1;
import 'package:your_ears_app/pages/boarding/presentation/screens/on_boarding.dart'
    as _i10;
import 'package:your_ears_app/pages/booking_details/presentation/screens/booking_details.dart'
    as _i2;
import 'package:your_ears_app/pages/bookings/presentation/screens/bookings.dart'
    as _i3;
import 'package:your_ears_app/pages/bottom_bar/presentation/screens/bottom_bar.dart'
    as _i4;
import 'package:your_ears_app/pages/congratulations/presentation/screen/congratulations_screen.dart'
    as _i5;
import 'package:your_ears_app/pages/contact_screen/presentation/screen/contact_screen.dart'
    as _i6;
import 'package:your_ears_app/pages/forget_screen/presentation/screen/forget_screen.dart'
    as _i8;
import 'package:your_ears_app/pages/forget_screen/presentation/widget/forget_field.dart'
    as _i7;
import 'package:your_ears_app/pages/loaction/presentation/screen/loaction_screen.dart'
    as _i9;
import 'package:your_ears_app/pages/otp_screen/presentation/screen/otp_screen.dart'
    as _i11;
import 'package:your_ears_app/pages/profile/presentation/screens/profile.dart'
    as _i12;
import 'package:your_ears_app/pages/reset_password/presentation/screen/reset_password.dart'
    as _i14;
import 'package:your_ears_app/pages/reset_password/presentation/widget/reset_field.dart'
    as _i13;
import 'package:your_ears_app/pages/sign_in/presentation/screen/sign_in.dart'
    as _i16;
import 'package:your_ears_app/pages/sign_in/presentation/widget/sigin_text_field.dart'
    as _i15;
import 'package:your_ears_app/pages/sign_up/presentation/screen/sign_up.dart'
    as _i17;
import 'package:your_ears_app/pages/splash/presentation/screens/splash.dart'
    as _i18;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    AboutAppScreenRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutAppScreen(),
      );
    },
    BookingDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BookingDetailsRouteArgs>(
          orElse: () => const BookingDetailsRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BookingDetails(key: args.key),
      );
    },
    BookingsScreenRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BookingsScreen(),
      );
    },
    BottomBarRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.BottomBar(),
      );
    },
    CongratulationsScreenRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CongratulationsScreen(),
      );
    },
    ContactScreenRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ContactScreen(),
      );
    },
    ForgetFieldRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ForgetField(),
      );
    },
    ForgetScreenRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ForgetScreen(),
      );
    },
    LoactionScreenRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoactionScreen(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.OnBoarding(),
      );
    },
    OtpScreenRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.OtpScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ProfileScreen(),
      );
    },
    ResetFieldRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ResetField(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ResetPassword(),
      );
    },
    SiginTextFieldRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SiginTextField(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SignIn(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.SignUp(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutAppScreen]
class AboutAppScreenRoute extends _i19.PageRouteInfo<void> {
  const AboutAppScreenRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AboutAppScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutAppScreenRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BookingDetails]
class BookingDetailsRoute extends _i19.PageRouteInfo<BookingDetailsRouteArgs> {
  BookingDetailsRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          BookingDetailsRoute.name,
          args: BookingDetailsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BookingDetailsRoute';

  static const _i19.PageInfo<BookingDetailsRouteArgs> page =
      _i19.PageInfo<BookingDetailsRouteArgs>(name);
}

class BookingDetailsRouteArgs {
  const BookingDetailsRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'BookingDetailsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.BookingsScreen]
class BookingsScreenRoute extends _i19.PageRouteInfo<void> {
  const BookingsScreenRoute({List<_i19.PageRouteInfo>? children})
      : super(
          BookingsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingsScreenRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BottomBar]
class BottomBarRoute extends _i19.PageRouteInfo<void> {
  const BottomBarRoute({List<_i19.PageRouteInfo>? children})
      : super(
          BottomBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomBarRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CongratulationsScreen]
class CongratulationsScreenRoute extends _i19.PageRouteInfo<void> {
  const CongratulationsScreenRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CongratulationsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'CongratulationsScreenRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ContactScreen]
class ContactScreenRoute extends _i19.PageRouteInfo<void> {
  const ContactScreenRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ContactScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactScreenRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ForgetField]
class ForgetFieldRoute extends _i19.PageRouteInfo<void> {
  const ForgetFieldRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ForgetFieldRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetFieldRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ForgetScreen]
class ForgetScreenRoute extends _i19.PageRouteInfo<void> {
  const ForgetScreenRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ForgetScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetScreenRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoactionScreen]
class LoactionScreenRoute extends _i19.PageRouteInfo<void> {
  const LoactionScreenRoute({List<_i19.PageRouteInfo>? children})
      : super(
          LoactionScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoactionScreenRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OnBoarding]
class OnBoardingRoute extends _i19.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i19.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OtpScreen]
class OtpScreenRoute extends _i19.PageRouteInfo<void> {
  const OtpScreenRoute({List<_i19.PageRouteInfo>? children})
      : super(
          OtpScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtpScreenRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ProfileScreen]
class ProfileScreenRoute extends _i19.PageRouteInfo<void> {
  const ProfileScreenRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ProfileScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileScreenRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ResetField]
class ResetFieldRoute extends _i19.PageRouteInfo<void> {
  const ResetFieldRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ResetFieldRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetFieldRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ResetPassword]
class ResetPasswordRoute extends _i19.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SiginTextField]
class SiginTextFieldRoute extends _i19.PageRouteInfo<void> {
  const SiginTextFieldRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SiginTextFieldRoute.name,
          initialChildren: children,
        );

  static const String name = 'SiginTextFieldRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SignIn]
class SignInRoute extends _i19.PageRouteInfo<void> {
  const SignInRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SignUp]
class SignUpRoute extends _i19.PageRouteInfo<void> {
  const SignUpRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SplashScreen]
class SplashScreenRoute extends _i19.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}
