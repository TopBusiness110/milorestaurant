
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:milorestaurant/core/widgets/custom_app_bar.dart';
import 'package:milorestaurant/features/favourite/widget/favourite_view.dart';
import 'package:milorestaurant/features/order/widget/order_view.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  FavouriteScreenState createState() => FavouriteScreenState();
}

class FavouriteScreenState extends State<FavouriteScreen> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    initCall();
  }

  void initCall(){
    // if(Get.find<AuthController>().isLoggedIn()) {
    //   Get.find<FavouriteController>().getRunningFavourites(1, notify: false);
    //   Get.find<FavouriteController>().getRunningSubscriptionFavourites(1, notify: false);
    //   Get.find<FavouriteController>().getHistoryFavourites(1, notify: false);
    //   // Get.find<FavouriteController>().getSubscriptions(1, notify: false);
    // }
  }

  @override
  Widget build(BuildContext context) {
  //  bool isLoggedIn = Get.find<AuthController>().isLoggedIn();
    return Scaffold(
      appBar: CustomAppBar(title: 'favourite'.tr(),isBackButtonExist: false),
      body:
      //isLoggedIn ?
      // GetBuilder<FavouriteController>(
      //   builder: (orderController) {
      //     return
            FavouriteView(isRunning: true)
       // },
     // )
      //     : NotLoggedInScreen(callBack: (value){
      //   initCall();
      //   setState(() {});
      // }),
    );
  }
}
