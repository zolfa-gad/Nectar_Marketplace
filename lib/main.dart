import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/constants/screens.dart';
import 'data/constants/titles.dart';
import 'data/services/local_sevices.dart';
import 'data/services/network_sevices.dart';
import 'presentation/screens/home/_home_screen.dart';
import 'presentation/screens/location/location_screen.dart';
import 'presentation/screens/login/log_in_screen.dart';
import 'presentation/screens/on boarding/on_boarding_screen.dart';
import 'presentation/screens/order/order_screen.dart';
import 'presentation/screens/register/register_screen.dart';
import 'presentation/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await AppNetworkServices.init();
  await AppLocalServices.init();
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: splashScreen,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Gilroy',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          toolbarHeight: appBarHeight,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.black,
            systemStatusBarContrastEnforced: true,
          ),
        ),
      ),
      routes: {
        splashScreen: (context) => const SplashScreen(),
        homeScreen: (context) => const HomeScreen(),
        onBoardScreen: (context) => const OnBoardingScreen(),
        signUpScreen: (context) => RegisterScreen(),
        logInScreen: (context) => LogInScreen(),
        locationScreen: (context) => const LocationScreen(),
        orderScreen: (context) => const OrderSuccessScreen(),
      },
      // home: RegisterScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (
        X509Certificate cert,
        String host,
        int port,
      ) =>
          true;
  }
}
