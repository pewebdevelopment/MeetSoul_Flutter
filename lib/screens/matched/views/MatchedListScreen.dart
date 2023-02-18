import 'dart:ui';

import 'package:datingui/res/colors.dart';
import 'package:datingui/res/images.dart';
import 'package:datingui/screens/premiumbottomsheet/PremiumBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:datingui/screens/matched/controller/MatchedListScreenController.dart';
import 'package:datingui/my_extensions.dart';
import 'package:shimmer/shimmer.dart';

import '../../../res/strings.dart';

class MatchedListScreen extends StatefulWidget {
  const MatchedListScreen({Key? key}) : super(key: key);

  @override
  _MatchedListScreenState createState() => _MatchedListScreenState();
}

class _MatchedListScreenState extends State<MatchedListScreen> {
  final MatchedListScreenController _controller =
      Get.put(MatchedListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        17.toVerticalSpace(),
         Text("Liked you").addTextStyle( TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600,color: Get.isDarkMode?Colors.white:Colors.black,)).addLeftPadding(12),
        6.toVerticalSpace(),

        likedList,
        17.toVerticalSpace(),

          Text("Matches").addTextStyle( TextStyle(
             fontSize: 20, fontWeight: FontWeight.w500,color: Get.isDarkMode?Colors.white:Colors.black,)).addLeftPadding(12),
        matchedList
      ],),
    );
  }

  get appBar {
    return AppBar(
      centerTitle: false,
      title: const Text(TXT_MATCHES).addTextStyle(const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  get matchedList {
    return Obx(() {
      return GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          shrinkWrap: true,
          itemCount: _controller.matchedUsers.value.length,
          itemBuilder: (context, index) {
            return matchedUserView(index);
          });
    });
  }

  Widget matchedUserView(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Hero(
                tag: _controller.matchedUsers.value[index].name,
                child: FadeInImage.assetNetwork(
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                    placeholder: AppImages.loading,
                    image: _controller.matchedUsers.value[index].images[0])),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  child: Row(
                    children: [
                      12.toHorizontalSpace(),
                      Text(
                        _controller.matchedUsers.value[index].name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        ", " + _controller.matchedUsers.value[index].age,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          AppImages.like,
                          color: Get.theme.primaryColor,
                        ),
                      )
                    ],
                  ),
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.3)),
                  height: 40,
                )),
            Positioned.fill(
                child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Get.theme.primaryColor.withOpacity(0.6),
                hoverColor: Colors.black,
                onTap: () {
                  _controller.onProfileClick(index);
                },
              ),
            ))
          ],
        ),
      ),
    );
  }

  likeView(index){
    return Padding(
      padding: const EdgeInsets.all(6),
      child: PhysicalModel(color: Colors.transparent,elevation: 0,child: Container(

        child: ClipRRect(borderRadius: BorderRadius.circular(10),child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: FadeInImage.assetNetwork(fit: BoxFit.cover,width: 100,height:100,placeholder: AppImages.loading, image:  _controller.matchedUsers.value[index].images[0]))),

      )).addGesture(onClick: ()
      {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
            elevation: 8,
            enableDrag: true,isScrollControlled: true,context: context, builder: (context){
         return PremiumBottomSheet();
        });
      }),
    );
  }

  get likedList {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(top: 6),
        height: 120,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: _controller.matchedUsers.value.length,
            itemBuilder: (context, index) {
              return likeView(index);
            }),
      );
    });
  }
}
