import 'package:datingui/screens/matched/views/MatchedListScreen.dart';
import 'package:datingui/screens/messages/messages_screen.dart';
import 'package:datingui/screens/myprofile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datingui/screens/swipeCard/view/SwipeCardScreen.dart';

class HomeController extends GetxController{
  RxInt currentIndex = 0.obs;
  Widget currentWidget = SwipeCardScreen();
  Widget matchWidget = MatchedListScreen();
  Widget messagesWidget = MessagesScreen();
  Widget profileWidget = ProfileScreen();

  onClickTab(int index){
    currentIndex.value = index;
  }
}