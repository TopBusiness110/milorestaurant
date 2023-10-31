
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milorestaurant/config/routes/app_routes.dart';
import 'package:milorestaurant/core/utils/app_colors.dart';
import 'package:milorestaurant/core/utils/assets_manager.dart';
import 'package:milorestaurant/core/utils/getsize.dart';
import 'package:milorestaurant/core/widgets/custom_button.dart';
import 'package:milorestaurant/core/widgets/custom_image.dart';

class FavouriteView extends StatelessWidget {
  final bool isRunning;
  final bool isSubscription;

   FavouriteView(
      {Key? key, required this.isRunning, this.isSubscription = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      body:    
        //orderList != null ? orderList.isNotEmpty ?
        RefreshIndicator(
        onRefresh: () async {
    },
    child: Center(
    child: SizedBox(
    width: getSize(context),
    child: ListView.builder(
    padding:  EdgeInsets.all(getSize(context)/22),
    itemCount: 10,
    //   physics:  NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
    return InkWell(
    onTap: () {
    // Get.toNamed(
    // RouteHelper.getFavouriteDetailsRoute(orderList![index].id),
    // arguments: FavouriteDetailsScreen(
    // orderId: orderList[index].id,
    // orderModel: orderList[index]),
    // );
    },
    child: Padding(
    padding:  EdgeInsets.all(getSize(context)/60),
    child: Stack(
    children: [
    Positioned(
    child: Padding(
    padding:  EdgeInsets.only(top: getSize(context)/60),
    child: Container(

    width: MediaQuery.of(context).size.width,
    padding:  EdgeInsets.all(
   getSize(context)/22),
    margin:EdgeInsets.only(top: 15),
    decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(
    getSize(context)/22),
    border: Border.all(color: Colors.orange),
    boxShadow: [
    BoxShadow(
    color: Colors.grey[
    Get.isDarkMode ? 700 : 300]!,
    blurRadius: 5,
    spreadRadius: 1)
    ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    SizedBox(
    height: 5,
    ),
      Center(
        child: Row(
          children: [
            Spacer(),
            Row(


              children: [
                ClipOval(
                  //  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(ImageAssets.chef,
                      height: getSize(context)/30, width: getSize(context)/30),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  'Customer Favourite',
                  style: TextStyle(
                      fontSize: getSize(context)/22,
                      color: Colors.black),
                )
              ],
            ),
            Spacer(),
            Container(
              height: 50,
              width: 50,
              child: Icon(Icons.favorite,color: Colors.orange,size: 40,),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                border: Border.all(color: AppColors.black)
              ),

            ),
          ],
        ),
      ),
    Row(
    children: [
    SizedBox(width: 10),
    Row(
    children: [
    ClipOval(
    //  borderRadius: BorderRadius.circular(30),
    child: CustomImage(
    image:
    "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg",
    height: 50,
    width: 50,
    fit: BoxFit.cover,
    ),
    ),
    SizedBox(
    width: 4,
    ),
    Text(
    'yaser hasan ',
    style: TextStyle(
    fontSize: 10,
    color: Colors.black),
    )
    ],
    ),
    Spacer(),
    Text('#3455',
      style: TextStyle(fontSize: getSize(context)/24,color: Colors.black),
    ),
      Spacer(),
    Row(


    children: [
    ClipOval(
    //  borderRadius: BorderRadius.circular(30),
    child: Image.asset(ImageAssets.hours,
    height: getSize(context)/50, width: getSize(context)/50),
    ),
    SizedBox(
    width: 2,
    ),
    Text(
    'منذ 4 ساعات',
    style: TextStyle(
    fontSize: 10,
    color: Colors.black),
    )
    ],
    )
    ],
    ),
    SizedBox(
    height: 5,
    ),
    Divider(color: AppColors.black,),
    Container(
  // color: Colors.grey[300],

    child: Center(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
  Row(children: [
    Padding(
      padding:  EdgeInsets.all(getSize(context)/70),
      child: Container(

        child: Padding(
          padding:  EdgeInsets.all(getSize(context)/70),
          child: Row(

          children: [
            Image.asset(ImageAssets.type,
                height: getSize(context)/50, width: getSize(context)/50),
            SizedBox(
              width: 4,
            ),
            Text(
              'نوع تقديم الطعام:',
              style: TextStyle(
                  fontSize: getSize(context)/32,
                  color: Colors.black),
            ),

            Text(
              'بوفيه',
              style: TextStyle(
                  fontSize: getSize(context)/32,
                  color: Colors.black),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
  ),
        ),
        decoration: BoxDecoration(
          color: AppColors.gray5,
          borderRadius: BorderRadius.all(Radius.circular(getSize(context)/22),

          )
        ),
      ),
    ),

    Padding(
      padding:  EdgeInsets.all(getSize(context)/70),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.gray5,
            borderRadius: BorderRadius.all(Radius.circular(getSize(context)/22),

            )
        ),
        child: Padding(
          padding:  EdgeInsets.all(getSize(context)/70),
          child: Row(

            children: [
              Image.asset(ImageAssets.guest1,
                  height: getSize(context)/50, width: getSize(context)/50),
              SizedBox(
                width: 4,
              ),
              Text(
                'عدد الضيوف:',
                style: TextStyle(
                    fontSize: getSize(context)/32,
                    color: Colors.black),
              ),
              Text(
                '11-25 فرد',
                style: TextStyle(
                    fontSize: getSize(context)/32,
                    color: Colors.black),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    ),
  ],),
 Row(children: [

   Padding(
     padding: EdgeInsets.all(getSize(context)/70),
     child: Container(
       decoration: BoxDecoration(
           color: AppColors.gray5,
           borderRadius: BorderRadius.all(Radius.circular(getSize(context)/22),

           )
       ),
       child: Padding(
         padding:  EdgeInsets.all(getSize(context)/70),
         child: Row(

           children: [
             Image.asset(ImageAssets.servicetype,
                 height: getSize(context)/50, width: getSize(context)/50),
             SizedBox(
               width: 4,
             ),
             Text(
               'نوع الخدمه:',
               style: TextStyle(
                   fontSize: getSize(context)/32,
                   color: Colors.black),
             ),
             Text(
               'توصيل فقط',
               style: TextStyle(
                   fontSize: getSize(context)/32,
                   color: Colors.black),
             )
           ],
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
         ),
       ),
     ),
   ),


   Padding(
     padding:  EdgeInsets.all(getSize(context)/70),
     child: Container(
       decoration: BoxDecoration(
           color: AppColors.gray5,
           borderRadius: BorderRadius.all(Radius.circular(getSize(context)/22),

           )
       ),
       child: Padding(
         padding:  EdgeInsets.all(getSize(context)/70),
         child: Row(

           children: [
             Image.asset(ImageAssets.food,
                 height: getSize(context)/50, width: getSize(context)/50),
             SizedBox(
               width: 4,
             ),
             Text(
               'المطبخ المفضل:',
               style: TextStyle(
                   fontSize: getSize(context)/32,
                   color: Colors.black),
             ),
             Text(
               'اسيوى',
               style: TextStyle(
                   fontSize: getSize(context)/32,
                   color: Colors.black),
             )
           ],
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
         ),
       ),
     ),
   ),
 ],),

  Row(
    children: [
      Padding(
        padding:  EdgeInsets.all(getSize(context)/70),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.gray5,
              borderRadius: BorderRadius.all(Radius.circular(getSize(context)/22),

              )
          ),
          child: Padding(
            padding:  EdgeInsets.all(getSize(context)/70),
            child: Row(

              children: [
                Image.asset(ImageAssets.vip,
                    height: getSize(context)/50, width: getSize(context)/50),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'مناسبة:',
                  style: TextStyle(
                      fontSize: getSize(context)/32,
                      color: Colors.black),
                ),

                Text(
                  'عيد ميلاد',
                  style: TextStyle(
                      fontSize: getSize(context)/32,
                      color: Colors.black),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.all(getSize(context)/70),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.gray5,
              borderRadius: BorderRadius.all(Radius.circular(getSize(context)/22),

              )
          ),
          child: Padding(
            padding:  EdgeInsets.all(getSize(context)/70),
            child: Row(

              children: [
                Image.asset(ImageAssets.add,
                    height: getSize(context)/50, width: getSize(context)/50),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'الطلبات الاضافيه:',
                  style: TextStyle(
                      fontSize: getSize(context)/32,
                      color: Colors.black),
                ),

                Text(
                  'موسيقى لايف',
                  style: TextStyle(
                      fontSize: getSize(context)/32,
                      color: Colors.black),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
        ),
      ),
    ],
  ),


   Row(children: [
     Padding(
       padding:  EdgeInsets.all(getSize(context)/70),
       child: Container(
         decoration: BoxDecoration(
             color: AppColors.gray5,
             borderRadius: BorderRadius.all(Radius.circular(getSize(context)/22),

             )
         ),
         child: Padding(
           padding: EdgeInsets.all(getSize(context)/70),
           child: Row(

             children: [
               Image.asset(ImageAssets.home1,
                   height: getSize(context)/55, width: getSize(context)/55),
               SizedBox(
                 width: 2,
               ),
               Text(
                 'نوع الحدث:',
                 style: TextStyle(
                     fontSize: getSize(context)/35,
                     color: Colors.black),
               ),
               Text(
                 'فى الداخل',
                 style: TextStyle(
                     fontSize: getSize(context)/35,
                     color: Colors.black),
               )
             ],
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
           ),
         ),
       ),
     ),

     Padding(
       padding:  EdgeInsets.all(getSize(context)/70),
       child: Container(
         decoration: BoxDecoration(
             color: AppColors.gray5,
             borderRadius: BorderRadius.all(Radius.circular(getSize(context)/22),

             )
         ),
         child: Padding(
           padding:  EdgeInsets.all(getSize(context)/70),
           child: Row(

             children: [
               Image.asset(ImageAssets.pay,
                   height: getSize(context)/55, width: getSize(context)/55),
               SizedBox(
                 width: 4,
               ),
               Text(
                 'تاريخ الحدث:',
                 style: TextStyle(
                     fontSize: getSize(context)/35,
                     color: Colors.black),
               ),
               Text(
                 '3 مارس 2023',
                 style: TextStyle(
                     fontSize: getSize(context)/35,
                     color: Colors.black),
               )
             ],
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
           ),
         ),
       ),
     ),
   ],),

 Row(
   children: [
     Padding(
       padding:  EdgeInsets.all(getSize(context)/70),
       child: Container(
         decoration: BoxDecoration(
             color: AppColors.gray5,
             borderRadius: BorderRadius.all(Radius.circular(getSize(context)/22),

             )
         ),
         child: Padding(
           padding: EdgeInsets.all(getSize(context)/70),
           child: Row(

           children: [
             Image.asset(ImageAssets.timer1,
                 height: getSize(context)/50, width: getSize(context)/50),
             SizedBox(
               width: 4,
             ),
             Text(
               'وقت الحدث:',
               style: TextStyle(
                   fontSize: getSize(context)/32,
                   color: Colors.black),
             ),

             Text(
               '21:00',
               style: TextStyle(
                   fontSize: getSize(context)/32,
                   color: Colors.black),
             )
           ],
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
   ),
         ),
       ),
     ),

     Padding(
       padding: EdgeInsets.all(getSize(context)/70),
       child: Container(
         decoration: BoxDecoration(
             color: AppColors.gray5,
             borderRadius: BorderRadius.all(Radius.circular(getSize(context)/22),

             )
         ),
         child: Padding(
           padding:  EdgeInsets.all(getSize(context)/70),
           child: Row(

             children: [
               Image.asset(ImageAssets.dolar,
                   height: getSize(context)/50, width: getSize(context)/50),
               SizedBox(
                 width: 4,
               ),
               Text(
                 'ميزانيه:',
                 style: TextStyle(
                     fontSize: getSize(context)/32,
                     color: Colors.black),
               ),
               Text(
                 '500\$',
                 style: TextStyle(
                     fontSize: getSize(context)/32,
                     color: Colors.black),
               )
             ],
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
           ),
         ),
       ),
     ),],
 ),

  Row(children: [
    Padding(
      padding:  EdgeInsets.all(getSize(context)/70),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.gray5,
            borderRadius: BorderRadius.all(Radius.circular(getSize(context)/22),

            )
        ),
        child: Padding(
          padding:  EdgeInsets.all(getSize(context)/70),
          child: Row(

            children: [
              Image.asset(ImageAssets.address1,
                  height: getSize(context)/55, width: getSize(context)/55),
              SizedBox(
                width: 2,
              ),
              Text(
                'عنوان الشارع :',
                style: TextStyle(
                    fontSize: getSize(context)/34,
                    color: Colors.black),
              ),

              Text(
                'امستردام',
                style: TextStyle(
                    fontSize: getSize(context)/34,
                    color: Colors.black),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    ),

    Padding(
      padding:  EdgeInsets.all(getSize(context)/70),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.gray5,
            borderRadius: BorderRadius.all(Radius.circular(getSize(context)/22),

            )
        ),
        child: Padding(
          padding:  EdgeInsets.all(getSize(context)/70),
          child: Row(

            children: [
              Image.asset(ImageAssets.mizan,
                  height: getSize(context)/55, width: getSize(context)/55),
              SizedBox(
                width: 2,
              ),
              Text(
                'احتياجات غذائية خاصة:',
                style: TextStyle(
                    fontSize: getSize(context)/34,
                    color: Colors.black),
              ),
              Text(
                'نباتى',
                style: TextStyle(
                    fontSize: getSize(context)/34,
                    color: Colors.black),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    ),
  ],)


    ],
    ),
    ),
    ),

    SizedBox(
    height: 5,
    ),
    ],
    ),
 
    ),
    ),
    ),
    ],
    ),
    ),
    );
    },
    ),
    )),
    ),
    );
  }
}
