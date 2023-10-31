import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milorestaurant/core/utils/assets_manager.dart';

import '../../../core/models/package_model.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/color_coverter.dart';
import '../../../core/utils/getsize.dart';
import '../cubit/register_cubit.dart';
import '../widget/subscription_card.dart';

class RegisterSeconed extends StatefulWidget {
  const RegisterSeconed({super.key});

  @override
  State<RegisterSeconed> createState() => _RegisterSeconedState();
}

class _RegisterSeconedState extends State<RegisterSeconed> {
  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit=context.read<RegisterCubit>();
    return  BlocBuilder<RegisterCubit, RegisterState>(
  builder: (context, state) {
    return SingleChildScrollView(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(child: Text(
            'Choose Your Business plan'
            ,style: TextStyle(fontSize: getSize(context)/32),
          ),),
          SizedBox(height:4 ,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: getSize(context)/30),
            child: Row(children: [
              cubit.configModel!=null&&  cubit.configModel!.businessPlan!.commission != 0 ?
              Expanded(
                child: baseCardWidget(cubit, context, title: 'commission_base'.tr(),
                    index: 0, onTap: ()=> cubit.setBusiness(0)),
              ) : const SizedBox(),
               SizedBox(width: getSize(context)/30),

              cubit.configModel!=null&& cubit.configModel!.businessPlan!.subscription != 0 ? Expanded(
                child: baseCardWidget(cubit, context, title: 'subscription_base'.tr(),
                    index: 1, onTap: ()=> cubit.setBusiness(1)),
              ) : const SizedBox(),
            ]),
          ),
          cubit.businessIndex == 0 ? Padding(
            padding:  EdgeInsets.symmetric(horizontal: getSize(context)/22),
            child: Text(
              "${'restaurant_will_pay'.tr()} ${10}% ${'commission_to'.tr()} ${'Milo App'} ${'from_each_order_You_will_get_access_of_all'.tr()}",
              style: TextStyle(color: AppColors.black,fontSize: getSize(context)/32,
              ), textAlign: TextAlign.start, textScaleFactor: 1.1,
            ),
          ) :
          Column(children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getSize(context)/22),
              child: Text(
                'run_restaurant_by_purchasing_subscription_packages'.tr(),
                style: TextStyle(color: AppColors.black,fontSize: getSize(context)/32,
                ), textAlign: TextAlign.start, textScaleFactor: 1.1,
              ),
            ),

            cubit.packageModel != null ? SizedBox(
              height: 600,
              child: (cubit.packageModel!.packages!.isNotEmpty && cubit.packageModel!.packages!.isNotEmpty) ?
              Swiper(

                itemCount: cubit.packageModel!.packages!.length,
                itemWidth: getSize(context) * 0.8,
                itemHeight: 600.0,
                layout: SwiperLayout.STACK,
                onIndexChanged: (index){
                 // cubit.selectSubscriptionCard(index);
                },
                itemBuilder: (BuildContext context, int index){
                  Packages package = cubit.packageModel!.packages![index];

                  Color color = ColorConverter.stringToColor(package.color);

                  return BlocBuilder<RegisterCubit,RegisterState>(
                    builder: (context, state) {
                      return
                        Stack(clipBehavior: Clip.none, children: [

                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(getSize(context)/22),
                            boxShadow: [BoxShadow(color: Colors.grey[ 200]!, spreadRadius: 1, blurRadius: 10)],
                          ),
                          padding:  EdgeInsets.all(getSize(context)/30),
                          margin:  EdgeInsets.only(top:getSize(context)/30, bottom:getSize(context)/30),
                          child: SubscriptionCard(index: index, authController: cubit, package: package, color: color),
                        ),

                        cubit.activeSubscriptionIndex == index ?
                        Positioned(
                          top: 5, right: -10,
                          child: Container(
                            height: 40, width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: color, border: Border.all(color: Theme.of(context).cardColor, width: 2),
                            ),
                            child: Icon(Icons.check, color: Theme.of(context).cardColor),
                          ),
                        ) : const SizedBox(),

                      ]);
                    },

                  );
                },
              ) : Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageAssets.emptyBox, height: 150),
                     SizedBox(height: getSize(context)/30),
                    Text('no_package_available'.tr()),
                  ]),
              ),
            ) : const CircularProgressIndicator(),

            // const SizedBox(height: Dimensions.paddingSizeLarge),

          ]),
        ],
      ),
    ));
  },
);
  }
  Widget baseCardWidget(RegisterCubit authController, BuildContext context,{ required String title, required int index, required Function onTap}){
    return InkWell(
      onTap: onTap as void Function()?,
      child: Stack(clipBehavior: Clip.none, children: [

        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getSize(context)/30),
              color: authController.businessIndex == index ? Theme.of(context).primaryColor.withOpacity(0.1) : Theme.of(context).cardColor,
              border: authController.businessIndex == index ? Border.all(color: Theme.of(context).primaryColor, width: 0.5) : null,
              boxShadow: authController.businessIndex == index ? null : [BoxShadow(color: Colors.grey[200]!, offset: const Offset(5, 5), blurRadius: 10)]
          ),
          padding:  EdgeInsets.symmetric(horizontal: getSize(context)/22, vertical: getSize(context)/22),
          child: Center(child: Text(title, style: TextStyle(color: authController.businessIndex == index ? Theme.of(context).primaryColor : Theme.of(context).textTheme.bodyLarge!.color, fontSize: getSize(context)/24))),
        ),

        authController.businessIndex == index ? Positioned(
          top: -10, right: -10,
          child: Container(
            padding:  EdgeInsets.all(getSize(context)/30),
            decoration: BoxDecoration(
              shape: BoxShape.circle, color: Theme.of(context).primaryColor,
            ),
            child: Icon(Icons.check, size: 14, color: Theme.of(context).cardColor),
          ),
        ) : const SizedBox()
      ]),
    );
  }

}
