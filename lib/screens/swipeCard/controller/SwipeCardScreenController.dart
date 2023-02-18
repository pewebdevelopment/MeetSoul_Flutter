import 'package:datingui/models/dummy.dart';
import 'package:datingui/screens/congo/CongoScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datingui/models/response/user/User.dart';
import 'package:swipable_stack/swipable_stack.dart';
import '../../otherProfile/OtherProfile.dart';


class SwipeCardScreenController extends GetxController{
  RxList<User> users = <User>[].obs;
  RxBool isEmpty = false.obs;
  late final SwipableStackController cardController;
  late AnimationController animationController,animationControllerSuper,animationControllerDislike;
  late Animation sizeAnimation,sizeAnimationSuper,sizeAnimationDislike;
  bool reverse = false;
  int animMilliSecond = 500;


   getUsersApi()async{
    users.addAll(DummyData().getUsers());
    users.refresh();
  }

  onSwipeCompleted(index, direction){
     if(index == 2 && direction == SwipeDirection.right){
           Get.to(CongoScreen(users.value[index]));
     }
    if(index ==  users.length-1) {
      isEmpty.value = true;
    }
  }

  onProfileClick(index){
    Get.to(OtherProfile(users[index]));
  }


  onClickLikeButton(){
    cardController.next(swipeDirection: SwipeDirection.right);
  }

  onClickDisLikeButton(){
    cardController.next(swipeDirection: SwipeDirection.left);
    animationControllerDislike.forward();
  }

  onClickSuperLikeButton(){
    cardController.next(swipeDirection: SwipeDirection.right);
    animationControllerSuper.forward();
  }



  @override
  void onInit() {
    super.onInit();
     getUsersApi();
    cardController = SwipableStackController();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    super.onClose();
  }



}