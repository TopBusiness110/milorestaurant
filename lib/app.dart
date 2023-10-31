import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:milorestaurant/features/login/cubit/login_cubit.dart';
import 'package:milorestaurant/features/onboard/cubit/onboarding_cubit.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'package:milorestaurant/injector.dart' as injector;

import 'features/register/cubit/register_cubit.dart';



class Milorestaurant extends StatefulWidget {
  const Milorestaurant({Key? key}) : super(key: key);

  @override
  State<Milorestaurant> createState() => _milorestaurantState();
}

class _milorestaurantState extends State<Milorestaurant> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(text);

    return
      MultiBlocProvider(
        providers: [

          BlocProvider(
            create: (_) => injector.serviceLocator<OnboardingCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<LoginCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<RegisterCubit>(),
          ),


        ],
          child: GetMaterialApp(
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: appTheme(),
        themeMode: ThemeMode.light,
        darkTheme: ThemeData.light(),

        // standard dark theme
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      )
      //   child:
     );
  }
}
