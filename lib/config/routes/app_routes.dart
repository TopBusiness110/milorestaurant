import 'package:flutter/material.dart';
import 'package:milorestaurant/features/dashboard/dashboard_screen.dart';
import 'package:milorestaurant/features/onboard/onboarding_screen.dart';
import 'package:milorestaurant/features/register/screen/Register.dart';
import 'package:milorestaurant/features/restaurant_details/restaurant_details.dart';
import 'package:milorestaurant/features/splash/screens/splash_screen.dart';


import 'package:page_transition/page_transition.dart';

import '../../core/utils/app_strings.dart';
import '../../features/login/screen/loginscreen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String signUp = '/signUp';
  static const String addorder = '/addorder';
  static const String restaurantOffer = '/restaurantOffer';
  static const String forgetPassword = '/forgetPassword';
  static const String resetPassword = '/resetPassword';
  static const String otpScreen = '/otpScreen';
  static const String homeScreen = '/homeScreen';
  static const String orderDetailsScreen = '/orderDetailsScreen';
  static const String offerDetailsScreen = '/offerDetailsScreen';
  static const String profileScreen = '/profileScreen';
  static const String storyScreen = '/storyScreen';
  static const String restaurantdetaialScreen = '/restaurantdetaialScreen';
}

class AppRoutes {
  static String route = '';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) =>  SplashScreen(),
        );
      case Routes.loginRoute:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child:  LoginScreen(),
        );
      case Routes.signUp:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: const Register(),
        );
      //   case Routes.restaurantOffer:
      //   return PageTransition(
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 1300),
      //     child: const RestaurantOffers(),
      //   );

      case Routes.homeScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: const DashboardScreen(pageIndex: 0),
        );
        // case Routes.storyScreen:
        // return PageTransition(
        //   type: PageTransitionType.fade,
        //   alignment: Alignment.center,
        //   duration: const Duration(milliseconds: 1300),
        //   child: const Story(),
        // );
        case Routes.restaurantdetaialScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: const RestaurantDetails(),
        );
      // case Routes.resetPassword:
      //   return PageTransition(
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 1300),
      //     child: const ResetPassword(),
      //   );
      // case Routes.otpScreen:
      //   return PageTransition(
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 1300),
      //     child: const OTPScreen(),
      //   );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (context) =>  OnBoardingScreen(),
        );
      // case Routes.homeScreen:
      //   return PageTransition(
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 1300),
      //     child: const HomeScreen(),
      //   );
      // case Routes.orderDetailsScreen:
      //   return PageTransition(
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 1300),
      //     child: const OrderDetailsScreen(),
      //   );
      //   case Routes.offerDetailsScreen:
      //   return PageTransition(
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 1300),
      //     child: const OfferDetailsScreen(),
      //   );
      // //ProfileScreen
      // case Routes.profileScreen:
      //   return PageTransition(
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 1300),
      //     child: const ProfileScreen(),
      //   );
      // case Routes.detailsRoute:
      //   final service = settings.arguments as ServicesModel;
      //   return MaterialPageRoute(
      //     // Extract the service model argument from the settings arguments map
      //
      //     builder: (context) => Details(service: service),
      //   );
      //

      // case Routes.signUp:
      //   return PageTransition(
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 1300),
      //     child: const SignUpScreen(),
      //   );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
