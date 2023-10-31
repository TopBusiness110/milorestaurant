import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:milorestaurant/core/remote/service.dart';
import 'package:milorestaurant/features/login/cubit/login_cubit.dart';
import 'package:milorestaurant/features/onboard/cubit/onboarding_cubit.dart';
import 'package:milorestaurant/features/register/cubit/register_cubit.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/app_interceptors.dart';
import 'core/api/base_api_consumer.dart';
import 'core/api/dio_consumer.dart';


// import 'features/downloads_videos/cubit/downloads_videos_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features

  ///////////////////////// Blocs ////////////////////////


  serviceLocator.registerFactory(
    () => OnboardingCubit(
        // serviceLocator(),
        ),
  );


  serviceLocator.registerFactory(
    () => LoginCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => RegisterCubit(
      serviceLocator(),
    ),
  );
  // serviceLocator.registerFactory(
  //   () => HomeCubit(
  //     serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerFactory(
  //   () => PostsCubit(
  //     serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerFactory(
  //       () => EditProfileCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  // serviceLocator.registerFactory(
  //       () => MyPostsCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  // serviceLocator.registerFactory(
  //       () => AddServiceCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  // serviceLocator.registerFactory(
  //       () => DetailsCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  //
  // serviceLocator.registerFactory(
  //       () => PrivacyCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  // serviceLocator.registerFactory(
  //       () => ContactUsCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  // serviceLocator.registerFactory(
  //       () => NottificationCubit(
  //     serviceLocator(),
  //   ),
  //
  // );

  ///////////////////////////////////////////////////////////////////////////////

  //! External
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  serviceLocator.registerLazySingleton(() => ServiceApi(serviceLocator()));

  serviceLocator.registerLazySingleton<BaseApiConsumer>(
      () => DioConsumer(client: serviceLocator()));
  serviceLocator.registerLazySingleton(() => AppInterceptors());

  // Dio
  serviceLocator.registerLazySingleton(
    () => Dio(
      BaseOptions(
        contentType: "application/x-www-form-urlencoded",
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );
}
