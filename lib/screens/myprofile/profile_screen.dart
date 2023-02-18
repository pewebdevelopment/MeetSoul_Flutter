import 'dart:math';

import 'package:datingui/models/dummy.dart';
import 'package:datingui/models/response/user/User.dart';
import 'package:datingui/res/colors.dart';
import 'package:datingui/res/images.dart';
import 'package:datingui/screens/edit_screens/editAbout/edit_about.dart';
import 'package:datingui/screens/edit_screens/editImage/edit_image.dart';
import 'package:datingui/screens/notifications/notifications_screen.dart';
import 'package:datingui/screens/preferences/PreferencesScreen.dart';
import 'package:datingui/screens/settings/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:datingui/my_extensions.dart';

import 'controller/profile_controller.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController _controller = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        margin: const EdgeInsets.only(left: 12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header,
            16.toVerticalSpace(),
             Padding(
              padding: EdgeInsets.only(left: 14.0),
              child:  Text("My Status",style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,),),
            ),
            6.toVerticalSpace(),
            status,
            10.toVerticalSpace(),
            row(AppImages.preferences, "Preferences").addGesture(onClick: ()=>Get.to(()=>PrefScreen())),
            row(AppImages.bell, "Notifications").addGesture(onClick: ()=>Get.to(()=>NotificationsScreen())),
            row(AppImages.settings, "Settings").addGesture(onClick: ()=>Get.to(()=>SettingScreen())),
            row(AppImages.logout, "Logout"),
          ],
        ),
      ),
    );
  }


  get appBar{
    return AppBar(title:   Text("Profile",style: TextStyle(fontSize: 19,color: Get.isDarkMode?Colors.white:Colors.black),),centerTitle: false,backgroundColor: Colors.transparent,elevation: 0,);
  }

  get header{
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 12,
      child: Container(
        decoration:  BoxDecoration(
            borderRadius:  BorderRadius.only(topLeft: Radius.circular(12),bottomLeft:  Radius.circular(12))
            ,gradient:  LinearGradient(colors: [Get.theme.primaryColor,Get.theme.primaryColorLight])),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        CircularPercentIndicator(radius: 70,
                            lineWidth: 3.0,
                            percent: 0.61,
                            circularStrokeCap: CircularStrokeCap.round,
                            linearGradient:  LinearGradient(colors: [Get.theme.primaryColor,Get.theme.primaryColorLight]),
                            backgroundColor: Colors.transparent,
                            startAngle: 14,
                            center: CircleAvatar(maxRadius: 60,backgroundImage: NetworkImage(_controller.user.images[0]),)),
                        Positioned(top: 20,right: 20,child: Icon(Icons.edit,color: Colors.white,).addInkwell(onClick: ()=>Get.to(()=>EditImage(_controller.user))))

                      ],
                    ),

                  ],
                ),

                Column(
                  children: [
                    Text(_controller.user.name,style: const TextStyle(color: Colors.white,fontSize: 18)),

                    Row(
                      children: const [
                        Icon(Icons.edit,color: Colors.white,),
                        Text("Edit bio",style:  TextStyle(color: Colors.white,fontSize: 13))
                      ],
                    ).addGesture(onClick: ()=>Get.to(()=>EditAbout(_controller.user))),
                  ],
                )
              ],
            ),

          ],
        ),
      ),
    );
  }

  get status{
    return SizedBox(
      height: 35,
      child: Obx(
     () {
          return ListView.builder(scrollDirection: Axis.horizontal,itemCount: _controller.status.value.length,itemBuilder: (c,i){
            return Obx(
             () {
                return Container(
                  margin: const EdgeInsets.only(left:12,right: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(color: i==_controller.selectedStatus.value?Colors.white:Get.theme.primaryColor,border: Border.all(color: i==_controller.selectedStatus.value?Get.theme.primaryColor:Colors.white,width: 1),borderRadius: const BorderRadius.all(const Radius.circular(14)))
                  ,child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(_controller.status.value[i].emoji),
                    ),
                //    Text("😀",style: TextStyle(color: i==1?Get.theme.primaryColor:Colors.white,fontSize: 16),),
                    4.toHorizontalSpace(),
                    Text(_controller.status.value[i].text,style: TextStyle(color: i==_controller.selectedStatus.value?Get.theme.primaryColor:Colors.white,fontSize: 12),),
                  ],
                )),).addGesture(onClick: ()=>_controller.onStatusClick(i));
              }
            );
          });
        }
      ),
    );
  }

  Widget row(image,name){
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(image,color:  Get.isDarkMode?Colors.white:primaryColor,width: 25,height: 25,),
        ),
       Text(name,style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,),)
     ],),
   );
  }

}
