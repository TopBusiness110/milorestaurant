import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:milorestaurant/config/routes/app_routes.dart';
import 'package:milorestaurant/core/utils/assets_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body:      Center(child: Image.asset(ImageAssets.logo, width: 150)),
    );
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 5)).then((value) => {
    FlutterNativeSplash.remove(),
      _getStoreUser()
    });

    print('go!');

  }
  Future<void> _getStoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('onBoarding') != null) {
      if (prefs.getString('user') != null) {

         // Navigator.pushReplacementNamed(context, Routes.homePageScreenRoute);

      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.loginRoute,
          ModalRoute.withName(
            Routes.initialRoute,
          ),
        );
      }
    } else {
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    }
  }

}
