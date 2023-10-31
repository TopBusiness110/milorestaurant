import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:milorestaurant/core/utils/app_colors.dart';
import 'package:milorestaurant/core/widgets/custom_image.dart';
import 'package:milorestaurant/features/dishes/Dishes.dart';
import 'package:milorestaurant/features/mostwanted/MostWanted.dart';
import 'package:milorestaurant/features/offers/offers.dart';


import '../../core/utils/getsize.dart';
import '../catering/catering.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: NestedScrollView(

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                Dishes(),
                Offers(
                ),
                MostWanted(),
                Catering(

                ),
              ],
            )),
          ],
        ), headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
              child: Container()
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          child: CustomImage(
                            image:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAgC3P9STBiexieI0Rolg7xYJvjejDvVQrtA&usqp=CAU",
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: Get.locale!.languageCode == 'ar' ? 4 : 0,
                        left: Get.locale!.languageCode == 'en' ? 4 : 0,
                        child: Align(
                          alignment: Get.locale!.languageCode == 'ar'
                              ? Alignment.topLeft
                              : Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Material(
                          shape: CircleBorder(),
                          color: Colors.white,
                          elevation: 5,
                          child: Container(
                            margin: EdgeInsets.only(left: 35, right: 35),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 5)),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.blue, width: 2)),
                              child: ClipOval(
                                //  borderRadius: BorderRadius.circular(30),
                                child: CustomImage(
                                  image:
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs-QgBlLOHMcF27Gg6DWSG0PDN2EUwzV9D0A&usqp=CAU",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 45),
                  child: Text(
                    'yaser hasan ',
                    style:TextStyle(
                        fontSize: 15,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 30),
                        child: Text(
                          '(The origin of the Asian flavor in food) ',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                      child: Text(
                        '09:00 Am - 01:30 Am ',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 10,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Colors.blueAccent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.white,
                      indicatorWeight: 4,
                      padding: EdgeInsetsDirectional.zero,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
                      labelColor: Colors.white,
                      labelPadding: EdgeInsets.zero,
                      unselectedLabelColor: Colors.white,
                      unselectedLabelStyle: TextStyle(
                          color: AppColors.disabledColor,
                          fontSize: getSize(context)/40),
                      labelStyle: TextStyle(
                          fontSize: getSize(context)/40,
                          color: AppColors.primary),
                      tabs: [
                        Tab(text: 'Dishes'.tr),
                        Tab(text: 'Offers'.tr),
                        Tab(text: 'Most Wanted'.tr),
                        Tab(text: 'Catering'.tr),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ];
      },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, initialIndex: 0, vsync: this);
  }
}
