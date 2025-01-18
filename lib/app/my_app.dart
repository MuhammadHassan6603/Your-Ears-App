import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_ears_app/pages/bottom_bar/presentation/provider/bottom_bar_provider.dart';
import 'package:your_ears_app/pages/home/presentation/provider/drawer_provider.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/calendar_provider.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/image_picker_provider.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/logout_provider.dart';
import 'package:your_ears_app/pages/profile/presentation/provider/update_profile_provider.dart';
import 'package:your_ears_app/pages/sign_in/presentation/provider/login_provider.dart';
import 'package:your_ears_app/pages/sign_in/presentation/provider/sign_in_visibility.dart';
import 'package:your_ears_app/pages/sign_up/presentation/provider/check_box_provider.dart';
import 'package:your_ears_app/pages/sign_up/presentation/provider/signup_provider.dart';
import 'package:your_ears_app/pages/sign_up/presentation/provider/visibility_provider.dart';
import 'package:your_ears_app/routes/routes_imports.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => BottomBarProvider()),
        ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => CheckBoxProvider()),
        ChangeNotifierProvider(create: (_) => SignInVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DateProvider()),
        ChangeNotifierProvider(create: (_) => ImageProviderModel()),
        ChangeNotifierProvider(create: (_) => ProfileProviderUpdate()),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
