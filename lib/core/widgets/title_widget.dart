
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import '../utils/getsize.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final Function? onTap;
  const TitleWidget({Key? key, required this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title, style: TextStyle(fontSize: getSize(context)/24)),
      // (onTap != null &&
      //     !ResponsiveHelper.isDesktop(context)) ?
      // InkWell(
      //   onTap: onTap as void Function()?,
      //   child: Padding(
      //     padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
      //     child: Text(
      //       '',
      //       style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).primaryColor),
      //     ),
      //   ),
      // ) :
      const SizedBox(),
    ]);
  }
}
