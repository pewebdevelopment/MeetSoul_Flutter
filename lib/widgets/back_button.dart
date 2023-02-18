import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datingui/my_extensions.dart';
import '../res/colors.dart';
import '../res/images.dart';
import '../screens/notifications/notifications_screen.dart';

class BackButtonCustomWithClick extends StatelessWidget {
  Function onClick;
  BackButtonCustomWithClick({required this.onClick }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,height: 44,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: Get.theme.primaryColor,
          onTap: (){
            onClick();
          },
          //hoverColor: Colors.blue,


          child: Container(child: const Center(child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back,color: Colors.black,),
          )),),
        ),
      ),
    );
  }
}

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom( ) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,height: 44,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: Get.theme.primaryColor,
          onTap: (){
           Get.back();
          },
          //hoverColor: Colors.blue,


          child: Container(child: const Center(child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back,color: Colors.black,),
          )),),
        ),
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:12.0),
      child: Image.asset(AppImages.notification,width: 24,height: 24,color:  Get.isDarkMode?Colors.white:Get.theme.primaryColor,),
    ).addGesture(onClick: (){
      Get.to(()=>NotificationsScreen());
    });
  }
}

