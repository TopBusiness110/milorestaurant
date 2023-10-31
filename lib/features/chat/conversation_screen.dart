
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:milorestaurant/core/utils/app_colors.dart';
import 'package:milorestaurant/core/utils/app_strings.dart';
import 'package:milorestaurant/core/widgets/custom_app_bar.dart';
import 'package:milorestaurant/core/widgets/not_logged_in_screen.dart';
import 'package:milorestaurant/core/widgets/search_field.dart';

import '../../core/utils/getsize.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    initCall();
  }

  void initCall(){
    // if(Get.find<AuthController>().isLoggedIn()) {
    //   Get.find<UserController>().getUserInfo();
    //   Get.find<ChatController>().getConversationList(1);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      CustomAppBar(title: 'conversation_list'.tr()),
      floatingActionButton: 
    FloatingActionButton.extended(
        label: Text('${'chat_with'.tr()} ${AppStrings.appName}', 
            style: TextStyle(fontSize: getSize(context)/24, color: Colors.white)),
        icon: const Icon(Icons.chat, color: Colors.white),
        backgroundColor: AppColors.primary,
        onPressed: () =>{

        }
        //     Get.toNamed(RouteHelper.getChatRoute(notificationBody: NotificationBody(
        //   notificationType: NotificationType.message, adminId: 0,
        // ))),
    ) ,
      body: Padding(
        padding:  EdgeInsets.all(getSize(context)/22),
        child: Column(children: [

          // (Get.find<AuthController>().isLoggedIn() && conversation != null && conversation.conversations != null
          //     && chatController.conversationModel!.conversations!.isNotEmpty) ?
          Center(child: SizedBox(width: getSize(context),
              child: SearchField(
            controller: _searchController,
            hint: 'search'.tr(),
            suffixIcon:  Icons.search,
            onSubmit: (String text) {
              // if(_searchController.text.trim().isNotEmpty) {
              //   chatController.searchConversation(_searchController.text.trim());
              // }else {
              //   showCustomSnackBar('write_something'.tr);
              // }
            },
            iconPressed: () {
              // if(chatController.searchConversationModel != null) {
              //   _searchController.text = '';
              //   chatController.removeSearchMode();
              // }else {
              //   if(_searchController.text.trim().isNotEmpty) {
              //     chatController.searchConversation(_searchController.text.trim());
              //   }else {
              //     showCustomSnackBar('write_something'.tr);
              //   }
              // }
            },
          ))) ,
          //     :
          // const SizedBox(),
          // (Get.find<AuthController>().isLoggedIn() && conversation != null && conversation.conversations != null
          //     && chatController.conversationModel!.conversations!.isNotEmpty) ?
          SizedBox(height:  getSize(context)/22 ),

          Expanded(child:
          // Get.find<AuthController>().isLoggedIn() ? (conversation != null && conversation.conversations != null)
          //     ? conversation.conversations!.isNotEmpty ? RefreshIndicator(
          //   onRefresh: () async {
          //     await Get.find<ChatController>().getConversationList(1);
          //   },
          //   child: SingleChildScrollView(
          //     controller: _scrollController,
          //     padding: EdgeInsets.zero,
          //     child: Center(child: SizedBox(width: getSize(context), child: PaginatedListView(
          //       scrollController: _scrollController,
          //       onPaginate: (int? offset) => chatController.getConversationList(offset!),
          //       totalSize: conversation.totalSize,
          //       offset: conversation.offset,
          //       enabledPagination: chatController.searchConversationModel == null,
          //       productView: ListView.builder(
          //         itemCount: conversation.conversations!.length,
          //         physics: const NeverScrollableScrollPhysics(),
          //         shrinkWrap: true,
          //         padding: EdgeInsets.zero,
          //         itemBuilder: (context, index) {
          //           User? user;
          //           String? type;
          //           if(conversation!.conversations![index]!.senderType == UserType.user.name
          //               || conversation.conversations![index]!.senderType == UserType.customer.name) {
          //             user = conversation.conversations![index]!.receiver;
          //             type = conversation.conversations![index]!.receiverType;
          //           }else {
          //             user = conversation.conversations![index]!.sender;
          //             type = conversation.conversations![index]!.senderType;
          //           }
          //
          //           String? baseUrl = '';
          //           if(type == UserType.vendor.name) {
          //             baseUrl = Get.find<SplashController>().configModel!.baseUrls!.restaurantImageUrl;
          //           }else if(type == UserType.delivery_man.name) {
          //             baseUrl = Get.find<SplashController>().configModel!.baseUrls!.deliveryManImageUrl;
          //           }else if(type == UserType.admin.name){
          //             baseUrl = Get.find<SplashController>().configModel!.baseUrls!.businessLogoUrl;
          //           }
          //
          //           return Container(
          //             margin: const EdgeInsets.only(bottom: getSize(context)/22),
          //
          //             decoration: BoxDecoration(
          //               color: AppColors.white, borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
          //               boxShadow: const [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5)],
          //             ),
          //             child: CustomInkWell(
          //               onTap: () {
          //                 if(user != null) {
          //                   Get.toNamed(RouteHelper.getChatRoute(
          //                     notificationBody: NotificationBody(
          //                       type: conversation!.conversations![index]!.senderType,
          //                       notificationType: NotificationType.message,
          //                       adminId: type == UserType.admin.name ? 0 : null,
          //                       restaurantId: type == UserType.vendor.name ? user.id : null,
          //                       deliverymanId: type == UserType.delivery_man.name ? user.id : null,
          //                     ),
          //                     conversationID: conversation.conversations![index]!.id,
          //                     index: index,
          //                   ));
          //                 }else {
          //                   showCustomSnackBar('${type!.tr} ${'not_found'.tr}');
          //                 }
          //               },
          //               highlightColor: AppColors.colorScheme.background.withOpacity(0.1),
          //               radius: Dimensions.radiusSmall,
          //               child: Stack(children: [
          //                 Padding(
          //                   padding: const EdgeInsets.all(getSize(context)/22),
          //                   child: Row(children: [
          //                     ClipOval(child: CustomImage(
          //                       height: 50, width: 50,
          //                       image: '$baseUrl/${user != null ? user.image : ''}',
          //                     )),
          //                     const SizedBox(width: getSize(context)/22),
          //
          //                     Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          //
          //                       user != null ? Text(
          //                         '${user.fName} ${user.lName}', style: robotoMedium,
          //                       ) : Text('user_deleted'.tr, style: robotoMedium),
          //                       const SizedBox(height: Dimensions.paddingSizeExtraSmall),
          //
          //                       Text(
          //                         type!.tr,
          //                         style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: AppColors.disabledColor),
          //                       ),
          //                     ])),
          //                   ]),
          //                 ),
          //
          //                 Positioned(
          //                   right: Get.find<LocalizationController>().isLtr ? 5 : null, bottom: 5, left: Get.find<LocalizationController>().isLtr ? null : 5,
          //                   child: Text(
          //                     DateConverter.localDateToIsoStringAMPM(DateConverter.dateTimeStringToDate(
          //                         conversation.conversations![index]!.lastMessageTime!)),
          //                     style: robotoRegular.copyWith(color: AppColors.hintColor, fontSize: Dimensions.fontSizeExtraSmall),
          //                   ),
          //                 ),
          //
          //                 GetBuilder<UserController>(builder: (userController) {
          //                   return (userController.userInfoModel != null && userController.userInfoModel!.userInfo != null
          //                       && conversation!.conversations![index]!.lastMessage!.senderId != userController.userInfoModel!.userInfo!.id
          //                       && conversation.conversations![index]!.unreadMessageCount! > 0) ? Positioned(right: Get.find<LocalizationController>().isLtr ? 5 : null,
          //                     top: 5, left: Get.find<LocalizationController>().isLtr ? null : 5,
          //                     child: Container(
          //                       padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
          //                       decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
          //                       child: Text(
          //                         conversation.conversations![index]!.unreadMessageCount.toString(),
          //                         style: robotoMedium.copyWith(color: AppColors.white, fontSize: Dimensions.fontSizeExtraSmall),
          //                       ),
          //                     ),
          //                   ) : const SizedBox();
          //                 }),
          //
          //               ]),
          //             ),
          //           );
          //         },
          //       ),
          //     ))),
          //   ),
          // ) :
        //   Center(child: Text('no_conversation_found'.tr()))
        // : const Center(child: CircularProgressIndicator()) :
    NotLoggedInScreen(callBack: (value){
            initCall();
            setState(() {});
          })),

        ]),
      ),
    );
    // return GetBuilder<ChatController>(builder: (chatController) {
    //   ConversationsModel? conversation;
    //   if(chatController.searchConversationModel != null) {
    //     conversation = chatController.searchConversationModel;
    //   }else {
    //     conversation = chatController.conversationModel;
    //   }
    //
    //
    // });
  }
}
