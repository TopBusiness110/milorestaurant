import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:milorestaurant/core/models/conversation_model.dart';
import 'package:milorestaurant/core/models/notification_body.dart';
import 'package:milorestaurant/core/utils/app_colors.dart';
import 'package:milorestaurant/core/widgets/custom_image.dart';
import 'package:milorestaurant/core/widgets/not_logged_in_screen.dart';

class ChatScreen extends StatefulWidget {
  final NotificationBody? notificationBody;
  final User? user;
  final int? conversationID;
  final int? index;
  const ChatScreen({Key? key,
    required this.notificationBody,
    required this.user,
    this.conversationID, this.index}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _inputMessageController = TextEditingController();
  StreamSubscription? _stream;

  @override
  void initState() {
    super.initState();


    initCall();

  }

  void initCall(){
    // if(Get.find<AuthController>().isLoggedIn()) {
    //   Get.find<ChatController>().getMessages(1, widget.notificationBody, widget.user, widget.conversationID, firstLoad: true);
    //
    //   if(Get.find<UserController>().userInfoModel == null || Get.find<UserController>().userInfoModel!.userInfo == null) {
    //     Get.find<UserController>().getUserInfo();
    //   }
    // }
  }

  @override
  void dispose() {
    super.dispose();
    _stream?.cancel();
  }

  @override
  Widget build(BuildContext context) {
     bool isLoggedIn=false;
    // chatController.messageModel != null ? '${chatController.messageModel!.conversation!.receiver!.fName}'
    //     ' ${chatController.messageModel!.conversation!.receiver!.lName}' :
    return    Scaffold(
      appBar: AppBar(
        title: Text(
        'receiver_name'.tr),
        backgroundColor: AppColors.primary,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40, height: 40, alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 2,color: AppColors.white),
                color: AppColors.white,
              ),
              child: ClipOval(child: CustomImage(
                image:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAgC3P9STBiexieI0Rolg7xYJvjejDvVQrtA&usqp=CAU",
                fit: BoxFit.cover, height: 40, width: 40,
              )),
            ),
          )
        ],
      ),

      body:
      // isLoggedIn ?
      // SafeArea(
      //   child: Center(
      //     child: SizedBox(
      //       width: ResponsiveHelper.isDesktop(context) ? getSize(context) : MediaQuery.of(context).size.width,
      //       child: Column(children: [
      //
      //         GetBuilder<ChatController>(builder: (chatController) {
      //           return Expanded(child: chatController.messageModel != null ? chatController.messageModel!.messages!.isNotEmpty ? SingleChildScrollView(
      //             controller: _scrollController,
      //             reverse: true,
      //             child: PaginatedListView(
      //               scrollController: _scrollController,
      //               reverse: true,
      //               totalSize: chatController.messageModel != null ? chatController.messageModel!.totalSize : null,
      //               offset: chatController.messageModel != null ? chatController.messageModel!.offset : null,
      //               onPaginate: (int? offset) async => await chatController.getMessages(
      //                 offset!, widget.notificationBody, widget.user, widget.conversationID,
      //               ),
      //               productView: ListView.builder(
      //                 physics: const NeverScrollableScrollPhysics(),
      //                 shrinkWrap: true,
      //                 reverse: true,
      //                 itemCount: chatController.messageModel!.messages!.length,
      //                 itemBuilder: (context, index) {
      //                   return MessageBubble(
      //                     message: chatController.messageModel!.messages![index],
      //                     user: chatController.messageModel!.conversation!.receiver,
      //                     userType: widget.notificationBody!.adminId != null ? UserType.admin
      //                         : widget.notificationBody!.deliverymanId != null ? UserType.delivery_man : UserType.vendor,
      //                   );
      //                 },
      //               ),
      //             ),
      //           ) : Center(child: Text('no_message_found'.tr)) : const Center(child: CircularProgressIndicator()));
      //         }),
      //
      //         (chatController.messageModel != null && (chatController.messageModel!.status! || chatController.messageModel!.messages!.isEmpty)) ? Container(
      //           color: AppColors.white,
      //           child: Column(children: [
      //
      //             GetBuilder<ChatController>(builder: (chatController) {
      //
      //               return chatController.chatImage.isNotEmpty ? SizedBox(height: 100,
      //                 child: ListView.builder(
      //                     scrollDirection: Axis.horizontal,
      //                     itemCount: chatController.chatImage.length,
      //                     itemBuilder: (BuildContext context, index){
      //                       return  chatController.chatImage.isNotEmpty ? Padding(
      //                         padding: const EdgeInsets.all(8.0),
      //                         child: Stack(children: [
      //
      //                           Container(width: 100, height: 100,
      //                             decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
      //                             child: ClipRRect(
      //                               borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingSizeDefault)),
      //                               child: Image.memory(
      //                                 chatController.chatRawImage[index], width: 100, height: 100, fit: BoxFit.cover,
      //                               ),
      //                             ),
      //                           ),
      //
      //                           Positioned(top:0, right:0,
      //                             child: InkWell(
      //                               onTap : () => chatController.removeImage(index, _inputMessageController.text.trim()),
      //                               child: Container(
      //                                 decoration: const BoxDecoration(
      //                                     color: Colors.white,
      //                                     borderRadius: BorderRadius.all(Radius.circular(Dimensions.paddingSizeDefault))
      //                                 ),
      //                                 child: const Padding(
      //                                   padding: EdgeInsets.all(4.0),
      //                                   child: Icon(Icons.clear, color: Colors.red, size: 15),
      //                                 ),
      //                               ),
      //                             ),
      //                           )],
      //                         ),
      //                       ) : const SizedBox();
      //                     }),
      //               ) : const SizedBox();
      //             }),
      //
      //             Row(children: [
      //
      //               InkWell(
      //                 onTap: () async {
      //                   Get.find<ChatController>().pickImage(false);
      //                 },
      //                 child: Padding(
      //                   padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      //                   child: Image.asset(Images.image, width: 25, height: 25, color: AppColors.hintColor),
      //                 ),
      //               ),
      //
      //               SizedBox(
      //                 height: 25,
      //                 child: VerticalDivider(width: 0, thickness: 1, color: AppColors.hintColor),
      //               ),
      //               const SizedBox(width: Dimensions.paddingSizeDefault),
      //
      //               Expanded(
      //                 child: TextField(
      //                   inputFormatters: [LengthLimitingTextInputFormatter(Dimensions.messageInputLength)],
      //                   controller: _inputMessageController,
      //                   textCapitalization: TextCapitalization.sentences,
      //                   style: robotoRegular,
      //                   keyboardType: TextInputType.multiline,
      //                   maxLines: null,
      //                   decoration: InputDecoration(
      //                     border: InputBorder.none,
      //                     hintText: 'type_here'.tr,
      //                     hintStyle: robotoRegular.copyWith(color: AppColors.hintColor, fontSize: getSize(context)/24),
      //                   ),
      //                   onSubmitted: (String newText) {
      //                     if(newText.trim().isNotEmpty && !Get.find<ChatController>().isSendButtonActive) {
      //                       Get.find<ChatController>().toggleSendButtonActivity();
      //                     }else if(newText.isEmpty && Get.find<ChatController>().isSendButtonActive) {
      //                       Get.find<ChatController>().toggleSendButtonActivity();
      //                     }
      //                   },
      //                   onChanged: (String newText) {
      //                     if(newText.trim().isNotEmpty && !Get.find<ChatController>().isSendButtonActive) {
      //                       Get.find<ChatController>().toggleSendButtonActivity();
      //                     }else if(newText.isEmpty && Get.find<ChatController>().isSendButtonActive) {
      //                       Get.find<ChatController>().toggleSendButtonActivity();
      //                     }
      //                   },
      //                 ),
      //               ),
      //
      //               GetBuilder<ChatController>(builder: (chatController) {
      //                 return chatController.isLoading ? const Padding(
      //                   padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      //                   child: SizedBox(height: 25, width: 25, child: CircularProgressIndicator()),
      //                 ) : InkWell(
      //                   onTap: () async {
      //                     if(chatController.chatImage.isNotEmpty || _inputMessageController.text.isNotEmpty) {
      //                       await chatController.sendMessage(
      //                         message: _inputMessageController.text, notificationBody: widget.notificationBody,
      //                         conversationID: widget.conversationID, index: widget.index,
      //                       );
      //                       _inputMessageController.clear();
      //                     }else {
      //                       showCustomSnackBar('write_something'.tr);
      //                     }
      //                   },
      //                   child: Padding(
      //                     padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      //                     child: Image.asset(
      //                       Images.send, width: 25, height: 25,
      //                       color: chatController.isSendButtonActive ? AppColors.primary : AppColors.hintColor,
      //                     ),
      //                   ),
      //                 );
      //               }
      //               ),
      //
      //             ]),
      //           ]),
      //         ) : const SizedBox(),
      //       ],
      //       ),
      //     ),
      //   ),
      // )
      //     :
      NotLoggedInScreen(callBack: (value){
        initCall();
        setState(() {});
      }),
    );
    // bool isLoggedIn = Get.find<AuthController>().isLoggedIn();
    // return
    //   GetBuilder<ChatController>(builder: (chatController) {
    //   String? baseUrl = '';
    //   if(widget.notificationBody!.adminId != null) {
    //     baseUrl = Get.find<SplashController>().configModel!.baseUrls!.businessLogoUrl;
    //   }else if(widget.notificationBody!.deliverymanId != null) {
    //     baseUrl = Get.find<SplashController>().configModel!.baseUrls!.deliveryManImageUrl;
    //   }else {
    //     baseUrl = Get.find<SplashController>().configModel!.baseUrls!.restaurantImageUrl;
    //   }
    //
    //
    // });
  }
}
