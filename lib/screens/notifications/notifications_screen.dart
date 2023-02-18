// ignore_for_file: prefer_const_constructors


import 'package:datingui/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:datingui/my_extensions.dart';
import 'package:get/get.dart';

import '../../widgets/my_circle_image.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.toVerticalSpace(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:18.0),
                  child: BackButtonCustom(),
                ),

                _heading("Notifications"),

              ],
            ),

            24.toVerticalSpace(),
            Expanded(
              child: ListView.separated(
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return _listItemMessage(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _heading(String text) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.0),
      child: Text(
        text,
        style:  TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontSize: 18),
      ),
    );
  }

  Widget _listItemMessage({required int index}) {
    return ListTile(
      leading: MyCircleImage(
        url: 'https://www.mrdustbin.com/wp-content/uploads/2020/09/dhrriti-saharan.jpg',
        imageSize: 56,
      ),
      minLeadingWidth: 56,
      title:  Text(
        "This is amazing! What a great way to inc..",
        style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,),
      ),
      subtitle: const Text(
        "20 min",
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
