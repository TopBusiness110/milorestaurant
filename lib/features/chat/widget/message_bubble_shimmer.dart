import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milorestaurant/core/utils/app_colors.dart';
import 'package:milorestaurant/core/utils/getsize.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MessageBubbleShimmer extends StatelessWidget {
final bool isMe;
const MessageBubbleShimmer({Key? key, required this.isMe}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Padding(
    padding: isMe ?  const EdgeInsets.fromLTRB(50, 5, 10, 5) : const EdgeInsets.fromLTRB(10, 5, 50, 5),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Shimmer(
            duration: const Duration(seconds: 2),
            // enabled:
            // Get.find<ChatController>().messageModel == null,
            child: Container(
              height: 30, width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft:  Radius.circular(getSize(context)/22),
                  bottomLeft: isMe ?  Radius.circular(getSize(context)/22) : const Radius.circular(0),
                  bottomRight: isMe ? const Radius.circular(0) :  Radius.circular(getSize(context)/22),
                  topRight:  Radius.circular(getSize(context)/22),
                ),
                color: isMe ? AppColors.hint : AppColors.disabledColor,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}
