
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milorestaurant/config/routes/app_routes.dart';
import 'package:milorestaurant/core/preferences/preferences.dart';
import 'package:milorestaurant/core/utils/app_colors.dart';
import 'package:milorestaurant/core/utils/getsize.dart';
import 'package:milorestaurant/core/widgets/custom_button.dart';
import 'package:milorestaurant/features/onboard/cubit/onboarding_cubit.dart';

class OnBoardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
OnboardingCubit cubit=context.read<OnboardingCubit>();
    return BlocBuilder<OnboardingCubit, OnboardingState>(
  builder: (context, state) {
    return Scaffold(
      body: 
        SafeArea(
          child: Center(child: SizedBox(
              width: MediaQuery.of(context).size.width, 
              child: Column(children: [

            Expanded(
                child: PageView.builder(
              itemCount: cubit.onBoardingList.length,
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(mainAxisAlignment: MainAxisAlignment.center, children: [

                  Padding(
                    padding: EdgeInsets.all(getSize(context)*0.05),
                    child: Image.asset(cubit.onBoardingList[index].imageUrl, height: getSize(context)*0.4),
                  ),

                  Text(
                    cubit.onBoardingList[index].title,
                    style: TextStyle(fontSize: getSize(context)*0.022, color: AppColors.primary),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: getSize(context)*0.025),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: getSize(context)/20),
                    child: Text(
                      cubit.onBoardingList[index].description,
                      style: TextStyle(fontSize: getSize(context)*0.022, color: AppColors.primary),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ]);
              },
              onPageChanged: (index) {
                cubit.changeSelectIndex(index);
              },
            )),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _pageIndicators(cubit, context),
            ),
            SizedBox(height: getSize(context)*0.05),

            Padding(
              padding:  EdgeInsets.all(getSize(context)/20),
              child: Row(children: [
                cubit.selectedIndex == 2 ? const SizedBox() : Expanded(
                  child: CustomButton(
                    color: AppColors.transparent,
                    textcolor: AppColors.primary,
                    text: 'skip'.tr(),
                    onClick: () {
                      Preferences.instance.setFirstInstall();
                      Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoute,   ModalRoute.withName(
                        Routes.initialRoute,
                      ),);
                    },
                  ),
                ),
                Expanded(
                  child: 
                  CustomButton(
                    borderRadius : cubit.selectedIndex != 2 ? 5 : 10,
                    text: cubit.selectedIndex != 2 ? 'next'.tr() : 'get_started'.tr(), color: AppColors.primary,
                    onClick: () {
                      if (cubit.selectedIndex != 2) {
                        _pageController.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease);
                      } else {
                        Preferences.instance.setFirstInstall();
                        Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoute,   ModalRoute.withName(
                          Routes.initialRoute,
                        ),);
                      }

                    }
                  ),
                ),
              ]),
            ),

          ]))),
        ) 
     
    );
  },
);
  }

  List<Widget> _pageIndicators(OnboardingCubit cubit, BuildContext context) {
    List<Container> indicators = [];

    for (int i = 0; i < cubit.onBoardingList.length; i++) {
      indicators.add(
        Container(
          width: 7,
          height: 7,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: i == cubit.selectedIndex ? AppColors.primary : AppColors.primary.withOpacity(0.40),
            borderRadius: i == cubit.selectedIndex ? BorderRadius.circular(50) : BorderRadius.circular(25),
          ),
        ),
      );
    }
    return indicators;
  }
}
