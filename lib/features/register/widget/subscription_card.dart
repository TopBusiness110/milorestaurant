
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milorestaurant/core/utils/app_colors.dart';
import 'package:milorestaurant/core/utils/getsize.dart';
import 'package:milorestaurant/features/register/cubit/register_cubit.dart';
import 'dart:ui' as ui;

import '../../../core/models/package_model.dart';
import '../../../core/utils/price_converter.dart';

class SubscriptionCard extends StatelessWidget {
  final int index;
  final Packages package;
  final RegisterCubit authController;
  final Color color;
  const SubscriptionCard({Key? key, required this.index, required this.package, required this.authController, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [

      ClipRRect(
        borderRadius:  BorderRadius.only(topLeft: Radius.circular(getSize(context)/22), topRight: Radius.circular(getSize(context)/22)),
        child: Stack(
          children: [

            ClipPath(
              clipper: CurveClipper(),
              child: Container(
              color: color.withOpacity(0.3),
              height: 140.0,
              ),
            ),

            ClipPath(
              clipper: CurveClipper(),
              child: Container(
                color: color.withOpacity(0.2),
                height: 160.0,
              ),
            ),

            // ClipPath(
            //   clipper: CurveClipper(),
            //   child: Container(
            //     alignment: Alignment.center,
            //     color: color.withOpacity(1), height: 120.0, width: double.infinity,
            //     child: Text('${package.packageName}', style: robotoBold.copyWith(fontSize: Dimensions.FONT_SIZE_OVER_LARGE, color: Theme.of(context).cardColor)),
            //   ),
            // ),

            ClipPath(
              clipper: CurveClipper(),
              child: Stack(
                children: [
                  SizedBox(
                    height: 120, width: size.width,
                    child: Container(
                      color: color.withOpacity(1),
                      height: 120.0,
                    ),
                  ),
                  Positioned(
                    child: SizedBox(
                      height: 120, width: size.width,
                      child: CustomPaint(
                        painter: const CardPaint(color: Colors.white),
                        child: Center(
                          child: Text(
                            '${package.packageName}',
                            style: TextStyle(fontSize: getSize(context)/22, color: AppColors.primary),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ]),
      ),

       SizedBox(height:getSize(context)/24),

      Text(
        PriceConverter.convertPrice(package.price,context: context), textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 35, color: color),
      ),

      Text('${package.validity} ' 'days'.tr, style:TextStyle(fontSize: getSize(context)/32)),
       SizedBox(height: getSize(context)/22),

      Divider(color: color, indent: 70, endIndent: 70, thickness: 2),
       SizedBox(height: getSize(context)/22),

      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        packageWidget(title: '${'order'.tr} (${package.maxOrder})'),

        packageWidget(title: '${'product'.tr} (${package.maxProduct})'),

       
      ]),

    ]);
  }

  Widget packageWidget({ required String title}){
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(Get.context!).size.width * 0.15),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(Icons.check_circle, size: 18, color: Colors.green),
           SizedBox(width: 5),

          Text(title, style: TextStyle(fontSize: 10)),
        ]),
      ),

      Divider(indent: 50, endIndent: 50, color: Theme.of(Get.context!).dividerColor,thickness: 1,)
    ]);
  }
}



class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 40;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CardPaint extends CustomPainter{
  final Color color;
  const CardPaint({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = ui.Gradient.linear(
          Offset(0, size.height),
          Offset( size.width*0.4, size.height*0.6),
          [Colors.white10, Colors.white12])
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, size.height*0.7)
      ..quadraticBezierTo(size.width*0.2, size.height*0.2, size.width*0.4, size.height*0.4)
      ..quadraticBezierTo(size.width*0.6, size.height*0.6, size.width*0.7, size.height*0.3)
      ..quadraticBezierTo(size.width*0.8, size.height*0.1, size.width*0.85, size.height*0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    Path path1 = Path()..moveTo(0, size.height)
      ..quadraticBezierTo(size.width*0.25, size.height*0.5, size.width*0.5, size.height*0.68)
      ..quadraticBezierTo(size.width*0.65, size.height*0.75, size.width*0.7, size.height*0.68)
      ..quadraticBezierTo(size.width*0.85, size.height*0.51, size.width*0.9, size.height*0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path1, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}
