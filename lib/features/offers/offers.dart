import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milorestaurant/core/utils/assets_manager.dart';



class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  margin: EdgeInsets.only(top: 37, left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.blueAccent),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 115,
                      ),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              " كن عميلاً خاصًا لـ Mealioواستفد من الخصومات الجذابة على أي طلب كن عميلاً خاصًا لـ Mealioواستفد من الخصومات الجذابة على أي طلب  كن عميلاً خاصًا لـ Mealioواستفد من الخصومات الجذابة على أي طلب كن عميلاً خاصًا لـ Mealioواستفد من الخصومات الجذابة على أي طلب",
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 20,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Get.locale!.languageCode == 'en'
                  ? Positioned(
                      left: -10,
                      child: Container(
                          margin: EdgeInsets.only(right: 40),
                          child: Image.asset(
                            ImageAssets.chief,
                            height: 250,
                            fit: BoxFit.cover,
                          )))
                  : Positioned(
                      right: -10,
                      child: Image.asset(
                        ImageAssets.chief,
                        height: 230,
                        fit: BoxFit.cover,
                      )),
            ],
          ),
        ),
        SizedBox(height: 10,),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15, left: 5, right: 5),
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                //margin: EdgeInsets.only(right: 40),
                                child: Image.asset(
                                  ImageAssets.offers,
                              height: 50,
                              fit: BoxFit.cover,
                            )),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "Take advantage of the offer for 20 people or more, including a meal of your choice and setting up the place, at a price of 200 \$",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Get.locale!.languageCode == 'ar'
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                              margin: EdgeInsets.only(right: 40),
                              child: Image.asset(
                                ImageAssets.offer1,
                                height: 80,
                                fit: BoxFit.cover,
                              )))
                      : Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.asset(
                            ImageAssets.offer1,
                            height: 80,
                            fit: BoxFit.cover,
                          )),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
