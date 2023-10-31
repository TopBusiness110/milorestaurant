
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:milorestaurant/config/routes/app_routes.dart';
import 'package:milorestaurant/core/utils/app_colors.dart';
import 'package:milorestaurant/core/utils/assets_manager.dart';
import 'package:milorestaurant/core/widgets/custom_button.dart';

import '../utils/getsize.dart';

class NotLoggedInScreen extends StatelessWidget {
  final Function(bool success) callBack;
  const NotLoggedInScreen({Key? key, required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  EdgeInsets.all(getSize(context)/22),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

          Image.asset(
            ImageAssets.guest,
            width: MediaQuery.of(context).size.height*0.25,
            height: MediaQuery.of(context).size.height*0.25,
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01),

          Text(
            'sorry'.tr(),
            style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.023, color: AppColors.primary),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01),

          Text(
            'you_are_not_logged_in'.tr(),
            style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.0175, color: AppColors.disabledColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.04),

          SizedBox(
            width: 200,
            child: CustomButton(text: 'login_to_continue'.tr(),
              //  height: 40,
                onClick: () async {
Navigator.pushNamed(context, Routes.loginRoute);
              // if(!ResponsiveHelper.isDesktop(context)) {
              //   await Get.toNamed(RouteHelper.getSignInRoute(Get.currentRoute));
              // }else{
              //   Get.dialog(const SignInScreen(exitFromApp: false, backFromThis: true)).then((value) => callBack(true));
              // }
              // if(Get.find<OrderController>().showBottomSheet) {
              //   Get.find<OrderController>().showRunningOrders();
              // }
              // callBack(true);

            }, color: AppColors.primary,),
          ),

        ]),
      ),
    );
  }
}
