import 'package:datingui/models/dummy.dart';
import 'package:datingui/screens/chat/chat_screen.dart';
import 'package:datingui/screens/otherProfile/OtherProfile.dart';
import 'package:datingui/screens/story/view_story.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:datingui/models/response/user/User.dart';

import '../../../models/response/messages/Message.dart';

class MessagesListScreenController extends GetxController{
  RxList<Message> messagesList = <Message>[].obs;
  RxList<User> matchesList = <User>[].obs;
  late Animation gap;
  late Animation<double> base;
  late Animation<double> reverse;
  late AnimationController controller;
  bool reversbool = false;

  
  
  void getMessagesApi()async{
    messagesList.addAll(DummyData().getMessages());
    messagesList.refresh();

    matchesList.addAll(DummyData().getUsers());

    matchesList.refresh();
   }

   onProfileClick(index){

    Get.to(()=>OtherProfile(messagesList.value[index].user,isMatched: true,));
   }

   onMatchClick(index){

    Get.to(()=>ShowStoryScreen(matchesList.value[index]));
   }

   onMessageClick(index){
    Get.to(()=>ChatScreen(messagesList.value[index].user));
   }


   @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 0)).then((value) =>   getMessagesApi() );

   }
}