import 'dart:async';

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milorestaurant/config/routes/app_routes.dart';
import 'package:milorestaurant/core/utils/app_colors.dart';
import 'package:milorestaurant/core/widgets/cart_widget.dart';
import 'package:milorestaurant/features/chat/conversation_screen.dart';
import 'package:milorestaurant/features/dashboard/widget/bottom_nav_item.dart';
import 'package:milorestaurant/features/order/order_screen.dart';
import 'package:milorestaurant/features/restaurant_details/restaurant_details.dart';

import '../../core/utils/getsize.dart';
import '../favourite/favourite_screen.dart';

class DashboardScreen extends StatefulWidget {
  final int pageIndex;
  final bool fromSplash;
  const DashboardScreen({Key? key, required this.pageIndex, this.fromSplash = false}) : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  PageController? _pageController;
  int _pageIndex = 0;
  late List<Widget> _screens;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  bool _canExit = GetPlatform.isWeb ? true : false;
  late bool _isLogin;
  bool active = false;

  @override
  void initState() {
    super.initState();

    // _isLogin = Get.find<AuthController>().isLoggedIn();
    //
    // if(_isLogin){
    //   if(Get.find<SplashController>().configModel!.loyaltyPointStatus == 1 && Get.find<AuthController>().getEarningPint().isNotEmpty && !ResponsiveHelper.isDesktop(Get.context)){
    //     Future.delayed(const Duration(seconds: 1), () => showAnimatedDialog(context, const CongratulationDialogue()));
    //   }
    //   suggestAddressBottomSheet();
    //   Get.find<OrderController>().getRunningOrders(1);
    // }

    _pageIndex = widget.pageIndex;

    _pageController = PageController(initialPage: widget.pageIndex);

    _screens = [
       OrderScreen(),
      FavouriteScreen(),
    //  const CartScreen(fromNav: true),
      RestaurantDetails(),
      const ConversationScreen(),
       Container(),
    ];

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });

    /*if(GetPlatform.isMobile) {
      NetworkInfo.checkConnectivity(_scaffoldKey.currentContext);
    }*/
  }


  // Future<void> suggestAddressBottomSheet() async {
  //   active = await Get.find<LocationController>().checkLocationActive();
  //   if(widget.fromSplash && Get.find<LocationController>().showLocationSuggestion && active){
  //     Future.delayed(const Duration(seconds: 1), () {
  //       showModalBottomSheet(
  //         context: context, isScrollControlled: true, backgroundColor: Colors.transparent,
  //         builder: (con) => const AddressBottomSheet(),
  //       ).then((value) {
  //         Get.find<LocationController>().hideSuggestedLocation();
  //         setState(() {});
  //       });
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          if(_canExit) {
            return true;
          }else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('back_press_again_to_exit'.tr, style: const TextStyle(color: Colors.white)),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
              margin:  EdgeInsets.all(getSize(context)/22),
            ));
            _canExit = true;
            Timer(const Duration(seconds: 2), () {
              _canExit = false;
            });
            return false;
          }
        }
      },
      child: Scaffold(
        key: _scaffoldKey,

        // floatingActionButton:
        // FloatingActionButton(
        //   elevation: 5,
        //   backgroundColor:  Colors.blue ,
        //   onPressed: () {
        //   Navigator.pushNamed(context, Routes.addorder);
        //
        //     // _setPage(2);
        //     //   Get.toNamed(RouteHelper.getCartRoute());
        //   },
        //   child: CartWidget(color: _pageIndex == 2 ? AppColors.white : AppColors.disabledColor, size: 30),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar:

        BottomAppBar(
          elevation: 5,
          notchMargin: 5,
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          color: AppColors.white,
          child: Padding(
            padding:  EdgeInsets.all(getSize(context)/40),
            child: Row(children: [
              BottomNavItem(iconData: Icons.home, isSelected: _pageIndex == 0, onTap: () => _setPage(0)),
              BottomNavItem(iconData: Icons.favorite_border, isSelected: _pageIndex == 1, onTap: () => _setPage(1)),
              // const Expanded(child: SizedBox()),
              BottomNavItem(iconData: Icons.food_bank, isSelected: _pageIndex == 2, onTap: () => _setPage(2)),
              BottomNavItem(iconData: Icons.message, isSelected: _pageIndex == 3, onTap: () => _setPage(3)),
              BottomNavItem(iconData:Icons.notifications, isSelected: _pageIndex == 4, onTap: () => _setPage(4)),
              // BottomNavItem(iconData: Icons.menu, isSelected: _pageIndex == 4, onTap: () {
              //   Get.bottomSheet(const MenuScreen(), backgroundColor: Colors.transparent, isScrollControlled: true);
              // }),
            ]),
          ),
        ),
        body:
        ExpandableBottomSheet(
          enableToggle: true,
          background: PageView.builder(
            controller: _pageController,
            itemCount: _screens.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _screens[index];
            },
          ),
          persistentContentHeight: 100, expandableContent: Container(),
        )
          // onIsContractedCallback: () {
          //   if(!orderController.showOneOrder) {
          //     orderController.showOrders();
          //   }
          // },
          // onIsExtendedCallback: () {
          //   if(orderController.showOneOrder) {
          //     orderController.showOrders();
          //   }
          // },



          // expandableContent:
          // (ResponsiveHelper.isDesktop(context) || !_isLogin || orderController.runningOrderList == null
          //     || orderController.runningOrderList!.isEmpty || !orderController.showBottomSheet) ? const SizedBox()
          //     : Dismissible(
          //   key: UniqueKey(),
          //   onDismissed: (direction) {
          //     if(orderController.showBottomSheet){
          //       orderController.showRunningOrders();
          //     }
          //   },
          //   child: RunningOrderViewWidget(reversOrder: reversOrder, onMoreClick: () {
          //     if(orderController.showBottomSheet){
          //       orderController.showRunningOrders();
          //     }
          //     _setPage(3);
          //   }),
          // ),

        )
      );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
