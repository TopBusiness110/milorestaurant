
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartWidget extends StatelessWidget {
  final Color? color;
  final double size;
  final bool fromRestaurant;
  const CartWidget({Key? key, required this.color, required this.size, this.fromRestaurant = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Icon(
        Icons.add, size: size,
        color: Colors.white,
      ),
        ]);
  }
}
