
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milorestaurant/core/utils/app_colors.dart';

import '../utils/getsize.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;
  final Function? onBackPressed;
  final bool showCart;
  final Color? bgColor;
  final Function(String value)? onVegFilterTap;
  final String? type;
  const CustomAppBar({Key? key, required this.title, this.isBackButtonExist = true, this.onBackPressed,
    this.showCart = false, this.bgColor, this.onVegFilterTap, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style:TextStyle(fontSize: getSize(context)/24, color: bgColor == null ? Theme.of(context).textTheme.bodyLarge!.color : AppColors.white)),
      centerTitle: true,
      leading: isBackButtonExist ? IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: bgColor == null ? Theme.of(context).textTheme.bodyLarge!.color : AppColors.white,
        onPressed: () => onBackPressed != null ? onBackPressed!() : Navigator.pop(context),
      ) : const SizedBox(),
      backgroundColor: bgColor ?? AppColors.white,
      elevation: 0,
      // actions: showCart || onVegFilterTap != null ? [
      //   showCart ? IconButton(
      //     onPressed: () => Get.toNamed(RouteHelper.getCartRoute()),
      //     icon: CartWidget(color: AppColors.textTheme.bodyLarge!.color, size: 25),
      //   ) : const SizedBox(),
      //
      //   onVegFilterTap != null ? VegFilterWidget(
      //     type: type,
      //     onSelected: onVegFilterTap,
      //     fromAppBar: true,
      //   ) : const SizedBox(),
      // ] : null,
    );
  }



   @override
   Size get preferredSize => Size(200, GetPlatform.isDesktop ? 70 : 50);
}
