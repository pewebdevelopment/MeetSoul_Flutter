import 'package:datingui/res/colors.dart';
import 'package:datingui/screens/home/views/HomeScreen.dart';
import 'package:datingui/screens/splash.dart';
import 'package:datingui/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:datingui/my_extensions.dart';
import 'package:get/get.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings").addTextStyle(TextStyle(color:Get.isDarkMode?Colors.white:Colors.black,fontSize: 17)),leading: BackButtonCustom().addOnlyPadding(left: 12,top: 8,bottom: 8),backgroundColor: Colors.transparent,elevation: 0,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Row(mainAxisAlignment:
            MainAxisAlignment.spaceBetween,children: [
            Text("Dark Mode").addTextStyle(TextStyle(fontSize: 14,color: Get.isDarkMode?Colors.white:primaryColor)),
            Switch(value: Get.isDarkMode, onChanged: (v){
              Get.isDarkMode?Get.changeThemeMode(ThemeMode.light):Get.changeThemeMode(ThemeMode.dark);
              Get.deleteAll(force: true);
              Get.offAll(HomeScreen());
              
            },activeColor: Get.theme.primaryColor,)
          ],),
          Divider(height: 1,color: Colors.grey,),
          Row(mainAxisAlignment:
          MainAxisAlignment.spaceBetween,children: [
            Text("Push Notifications").addTextStyle(TextStyle(fontSize: 14,color: Get.isDarkMode?Colors.white:primaryColor)),
            Switch(value: false, onChanged: (v){},activeColor: Get.theme.primaryColor,)
          ],),
          4.toVerticalSpace(),
          Divider(height: 1,color: Colors.grey,),
          13.toVerticalSpace(),

          Text("Delete Account").addTextStyle(TextStyle(fontSize: 14,color: Get.isDarkMode?Colors.white:primaryColor)),
          12.toVerticalSpace(),
          Divider(height: 1,color: Colors.grey,),
          12.toVerticalSpace(),

          Text("Pause Account").addTextStyle(TextStyle(fontSize: 14,color: Get.isDarkMode?Colors.white:primaryColor)),
          12.toVerticalSpace(),
          Divider(height: 1,color: Colors.grey,),
          12.toVerticalSpace(),
          Text("Privacy Policy").addTextStyle(TextStyle(fontSize: 14,color: Get.isDarkMode?Colors.white:primaryColor)),
          12.toVerticalSpace(),
          Divider(height: 1,color: Colors.grey,),
          12.toVerticalSpace(),

          Text("Terms & Conditions").addTextStyle(TextStyle(fontSize: 14,color: Get.isDarkMode?Colors.white:primaryColor)),
          22.toVerticalSpace(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130),
            child: Divider(height: 1,color: Colors.grey,),
          ),
          12.toVerticalSpace(),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            Text("App Version").addTextStyle(TextStyle(fontSize: 14,color: Get.isDarkMode?Colors.white:primaryColor)),

          ],),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            Text("1.1").addTextStyle(TextStyle(fontSize: 14,color: Get.isDarkMode?Colors.white:primaryColor)),

          ],)


        ],),
      ),
    );
  }
}
