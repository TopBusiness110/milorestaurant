
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:milorestaurant/core/widgets/custom_app_bar.dart';
import 'package:milorestaurant/features/order/widget/order_view.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  OrderScreenState createState() => OrderScreenState();
}

class OrderScreenState extends State<OrderScreen> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    initCall();
  }

  void initCall(){
    // if(Get.find<AuthController>().isLoggedIn()) {
    //   Get.find<OrderController>().getRunningOrders(1, notify: false);
    //   Get.find<OrderController>().getRunningSubscriptionOrders(1, notify: false);
    //   Get.find<OrderController>().getHistoryOrders(1, notify: false);
    //   // Get.find<OrderController>().getSubscriptions(1, notify: false);
    // }
  }

  @override
  Widget build(BuildContext context) {
  //  bool isLoggedIn = Get.find<AuthController>().isLoggedIn();
    return Scaffold(
      appBar: CustomAppBar(title: 'my_orders'.tr(),isBackButtonExist: false),
      body:
      //isLoggedIn ?
      // GetBuilder<OrderController>(
      //   builder: (orderController) {
      //     return
            OrderView(isRunning: true)
       // },
     // )
      //     : NotLoggedInScreen(callBack: (value){
      //   initCall();
      //   setState(() {});
      // }),
    );
  }
}
