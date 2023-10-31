import 'package:country_code_picker/country_code.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milorestaurant/core/utils/app_colors.dart';
import 'package:milorestaurant/core/utils/assets_manager.dart';


import '../../../config/routes/app_routes.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/customtextfield.dart';
import '../../../core/widgets/customloginstatusbutton.dart';
import '../../../core/widgets/loginappbar.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode _phoneFocus = FocusNode();
    final FocusNode _passwordFocus = FocusNode();
    String? _countryDialCode;
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        LoginCubit cubit = context.read<LoginCubit>();
        return      WillPopScope(
          onWillPop: () async {
           return true;
          },
          child: Scaffold(
            body: SafeArea(child: Center(
              child: Scrollbar(
                child: SingleChildScrollView(
                  physics:  BouncingScrollPhysics(),
                  padding:  EdgeInsets.all(getSize(context)/24),
                  child: Center(
                    child: SizedBox(
                      width: 1170,
                      child: Column(children: 
                      [

                        Image.asset(ImageAssets.logo, width: 100),
                         SizedBox(height: getSize(context)/24),
                   //     Image.asset(ImageAssets.logoName, width: 100),
                         SizedBox(height: getSize(context)/24),

                        Text('sign_in'.tr().toUpperCase(), style:TextStyle(fontSize: 30,color: AppColors.black)),
                         SizedBox(height: getSize(context)/70),

                        Text(
                          'only_for_restaurant_owner'.tr(), textAlign: TextAlign.center,
                          style: TextStyle(fontSize: getSize(context)/30, color: AppColors.primary),
                        ),
                         SizedBox(height: 50),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(getSize(context)/22),
                            color: Theme.of(context).cardColor,
                            boxShadow: [BoxShadow(color: Colors.grey[ 200]!, spreadRadius: 1, blurRadius: 5)],
                          ),
                          child: Column(children: [

                            CustomTextField(
                              hintText: 'email'.tr(),
                              controller: cubit.emailController,
                              focusNode: cubit.emailFocus,
                              nextFocus: _passwordFocus,
                              inputType: TextInputType.emailAddress,
                              prefixIcon: Icons.mail_outline_rounded,
                              divider: true,
                              showBorder: false,
                            ),

                            CustomTextField(
                              hintText: 'password'.tr(),
                              controller: cubit.passwordController,
                              focusNode:cubit.passwordFocus,
                              inputAction: TextInputAction.done,
                              inputType: TextInputType.visiblePassword,
                              prefixIcon: Icons.lock,
                              isPassword: true,
                              showBorder: false,
                              onSubmit: (text) =>
                              null,
                            ),

                          ]),
                        ),
                         SizedBox(height: 10),

                        Row(children: [
                          Expanded(
                            child: ListTile(
                              onTap: () => cubit.toggleRememberMe(),
                              leading: Checkbox(
                                activeColor: Theme.of(context).primaryColor,
                                value: cubit.isActiveRememberMe,
                                onChanged: (bool? isChecked) => cubit.toggleRememberMe(),
                              ),
                              title: Text('remember_me'.tr()),
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              horizontalTitleGap: 0,
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                {

                                },
                            child: Text('${'forgot_password'.tr()}?'),
                          ),
                        ]),
                         SizedBox(height: 50),


                        CustomButton(
                          text: 'sign_in'.tr(),
                          onClick: () => {

                            Navigator.pushNamed(context, Routes.homeScreen)
                          }, color: AppColors.primary,
                        ) ,
                        SizedBox(height:  getSize(context)/24 ),

                        cubit.configModel!=null&& cubit.configModel!.toggleRestaurantRegistration! ?
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize:  Size(1, 40),
                          ),
                          onPressed: () async {
                            Navigator.pushNamed(context, Routes.signUp);
                         //   Get.toNamed(RouteHelper.getRestaurantRegistrationRoute());
                          },
                          child: RichText(text: TextSpan(children: [
                            TextSpan(text: '${'join_as'.tr()} ', style: TextStyle(color: AppColors.disabledColor)),
                            TextSpan(text: 'restaurant'.tr(), style:TextStyle(color: AppColors.primary)),
                          ])),
                        ) :  SizedBox(),

                      ]),
                    ),
                  ),
                ),
              ),
            )),
          ),
        );

      },
    );
  }
}
