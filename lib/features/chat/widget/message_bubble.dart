
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milorestaurant/core/models/conversation_model.dart';
import 'package:milorestaurant/core/models/message_model.dart';
import 'package:milorestaurant/core/models/user_type.dart';
import 'package:milorestaurant/core/utils/app_colors.dart';
import 'package:milorestaurant/core/utils/date_converter.dart';
import 'package:milorestaurant/core/widgets/custom_image.dart';
import 'package:milorestaurant/features/chat/widget/image_dialog.dart';

import '../../../core/utils/getsize.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final User? user;
  final UserType userType;
  const MessageBubble({Key? key, required this.message, required this.user, required this.userType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BaseUrls? baseUrl = Get.find<SplashController>().configModel!.baseUrls;
    // bool isReply = message.senderId != Get.find<UserController>().userInfoModel!.userInfo!.id;
    //
    return
    //   (isReply) ?
    // Container(
    //   margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: Dimensions.paddingSizeExtraSmall),
    //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(getSize(context)/22)),
    //   padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
    //   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //
    //     Text('${user!.fName} ${user!.lName}', style: robotoRegular.copyWith(fontSize: getSize(context)/24)),
    //     const SizedBox(height: getSize(context)/22),
    //
    //     Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
    //
    //       ClipRRect(
    //         borderRadius: BorderRadius.circular(20.0),
    //         child: CustomImage(
    //           fit: BoxFit.cover, width: 40, height: 40,
    //           image: '${userType == UserType.admin ? baseUrl!.businessLogoUrl : userType == UserType.vendor
    //               ? baseUrl!.restaurantImageUrl : baseUrl!.deliveryManImageUrl}/${user!.image}',
    //         ),
    //       ),
    //       const SizedBox(width: 10),
    //
    //       Flexible(
    //         child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
    //
    //           if(message.message != null) Flexible(
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 color: AppColors.secondaryHeaderColor,
    //                 borderRadius: const BorderRadius.only(
    //                   bottomRight: Radius.circular(Dimensions.radiusDefault),
    //                   topRight: Radius.circular(Dimensions.radiusDefault),
    //                   bottomLeft: Radius.circular(Dimensions.radiusDefault),
    //                 ),
    //               ),
    //               padding: EdgeInsets.all(message.message != null ? Dimensions.paddingSizeDefault : 0),
    //               child: Text(message.message ?? ''),
    //             ),
    //           ),
    //           const SizedBox(height: 8.0),
    //
    //           (message.files != null && message.files!.isNotEmpty) ? GridView.builder(
    //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                 childAspectRatio: 1,
    //                 crossAxisCount: ResponsiveHelper.isDesktop(context) ? 8 : 3,
    //                 mainAxisSpacing: 10,
    //                 crossAxisSpacing: 5,
    //               ),
    //               shrinkWrap: true,
    //               physics: const NeverScrollableScrollPhysics(),
    //               itemCount: message.files!.length,
    //               itemBuilder: (BuildContext context, index) {
    //                 return  message.files!.isNotEmpty ? Padding(
    //                   padding: const EdgeInsets.only(right: 8),
    //                   child: InkWell(
    //                     hoverColor: Colors.transparent,
    //                     onTap: () => showDialog(context: context, builder: (context) {
    //                       return ImageDialog(imageUrl: '${baseUrl.chatImageUrl}/${message.files![index]}');
    //                     }),
    //                     child: ClipRRect(
    //                       borderRadius: BorderRadius.circular(getSize(context)/22),
    //                       child: CustomImage(
    //                         height: 100, width: 100, fit: BoxFit.cover,
    //                         image: '${baseUrl.chatImageUrl}/${message.files![index]}',
    //                       ),
    //                     ),
    //                   ),
    //                 ) : const SizedBox();
    //
    //               }) : const SizedBox(),
    //
    //         ]),
    //       ),
    //     ]),
    //     const SizedBox(height: getSize(context)/22),
    //
    //     Text(
    //       DateConverter.localDateToIsoStringAMPM(DateTime.parse(message.createdAt!)),
    //       style: robotoRegular.copyWith(color: AppColors.hintColor, fontSize: Dimensions.fontSizeSmall),
    //     ),
    //   ]),
    // ) :
    Container(
      padding:  EdgeInsets.symmetric(horizontal:getSize(context)/24),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(getSize(context)/22)),
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [

        Text(
          'name',
          style: TextStyle(fontSize: getSize(context)/24),
        ),
         SizedBox(height: getSize(context)/22),

        Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [

          Flexible(
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.end, children: [

              (message.message != null && message.message!.isNotEmpty) ? Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.5),
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(getSize(context)/22),
                      bottomRight: Radius.circular(getSize(context)/22),
                      bottomLeft: Radius.circular(getSize(context)/22),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(message.message != null ? getSize(context)/22 : 0),
                    child: Text(message.message ?? ''),
                  ),
                ),
              ) : const SizedBox(),

              (message.files != null && message.files!.isNotEmpty) ? Directionality(
                textDirection: TextDirection.rtl,
                child: GridView.builder(
                    reverse: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5,
                    ),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: message.files!.length,
                    itemBuilder: (BuildContext context, index){
                      return  message.files!.isNotEmpty ?
                      InkWell(
                        onTap: () => showDialog(context: context, builder: (context) {
                     return ImageDialog(imageUrl:

                       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAgC3P9STBiexieI0Rolg7xYJvjejDvVQrtA&usqp=CAU",);
                        }),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: getSize(context)/22 , right:  0,
                              top: (message.message != null && message.message!.isNotEmpty) ? getSize(context)/22 : 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(getSize(context)/22),
                            child: CustomImage(
                              height: 100, width: 100, fit: BoxFit.cover,
                              image:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAgC3P9STBiexieI0Rolg7xYJvjejDvVQrtA&usqp=CAU",                            ),
                          ),
                        ),
                      ) : const SizedBox();
                    }),
              ) : const SizedBox(),
            ]),
          ),
           SizedBox(width: getSize(context)/22),

          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: CustomImage(
              fit: BoxFit.cover, width: 40, height: 40,
              image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAgC3P9STBiexieI0Rolg7xYJvjejDvVQrtA&usqp=CAU",            ),
          ),
        ]),

        Icon(
          message.isSeen == 1 ? Icons.done_all : Icons.check,
          size: 12,
          color: message.isSeen == 1 ? AppColors.primary : AppColors.disabledColor,
        ),
         SizedBox(height: getSize(context)/22),

        Text(
          DateConverter.localDateToIsoStringAMPM(DateTime.parse(message.createdAt!)),
          style: TextStyle(color: AppColors.hint, fontSize: getSize(context)/24),
        ),
         SizedBox(height: getSize(context)/22),

      ])

      // GetBuilder<UserController>(builder: (profileController) {
      //
      //   return
      // }),
    );
  }
}
