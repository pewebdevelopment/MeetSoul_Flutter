import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:datingui/main.dart';
import 'package:datingui/models/response/user/User.dart';
import 'package:datingui/res/images.dart';
import 'package:datingui/screens/chat/chat_screen.dart';
import 'package:datingui/screens/otherProfile/controller/otherprofile_controller.dart';
import 'package:datingui/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheet/sheet.dart';
import 'package:datingui/my_extensions.dart';
import '../../res/colors.dart';

class OtherProfile extends StatefulWidget {
  User user;
  bool isMatched;
  OtherProfile(this.user,{this.isMatched = false}) : super();

  @override
  _OtherProfileState createState() => _OtherProfileState();
}

class _OtherProfileState extends State<OtherProfile> {
  final OtherProfileController _controller = Get.put(OtherProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              image,
              widget.user.images.length > 1 ? imagesWidget : Container(),
              sheet,
              backButton
            ],
          ),
        ],
      ),
    );
  }

  get backButton {
    return BackButtonCustom().addOnlyPadding(left: 18,top: 24);
  }

  get sheet {
    return Sheet(
      backgroundColor: Colors.transparent,
      maxExtent: Get.height - 150,
      elevation: 12,
      initialExtent: (MediaQuery.of(context).size.height / 2) -
          (MediaQuery.of(context).size.height / 2) / 12,
      minExtent: (MediaQuery.of(context).size.height / 2) -
          (MediaQuery.of(context).size.height / 2) / 12,
      fit: SheetFit.expand,
      controller: _controller.sheetController,
      child: sheetChild,
    );
  }

  get sheetChild {
    return Container(
      decoration:  BoxDecoration(
        color: Get.isDarkMode?Colors.black:Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(28), topLeft: Radius.circular(28)),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            name,
            address,
            text("About Me", widget.user.about),
            15.toVerticalSpace(),
             Text(
              "My Hobbies",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.white:Colors.black,),
            ),
            10.toVerticalSpace(),
            hobbies,
            text("Relationship", widget.user.relation),
            text("Interested In", widget.user.intrestedin)
          ],
        ),
      ),
    );
  }

  Widget text(String key, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.toVerticalSpace(),
        Text(
          key,
          style:  TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.white:Colors.black,),
        ),
        10.toVerticalSpace(),
        Text(
          value,
          style: const TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  get name {
    return Row(
      children: [
        Text(
          widget.user.name,
          style:  TextStyle(fontSize: 19, fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.white:Colors.black,),
        ),
        Text(
          ", " + widget.user.age,
          style:  TextStyle(fontSize: 19, fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.white:Colors.black,),
        ),
        widget.user.check
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  AppImages.check,
                  height: 16,
                  width: 16,

                ),
              )
            : Container(),
       const  Spacer(),
        widget.isMatched? Icon(Icons.message_rounded,color: Get.theme.primaryColor,).addGesture(onClick: (){
          Get.to(()=>ChatScreen(widget.user));
        }):Container()

      ],
    );
  }

  get address {
    return Row(
      children: [
        Text(
          widget.user.address,
          style: const TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),
        ),
         Icon(
          Icons.location_on_outlined,
          color: Get.theme.primaryColor,
          size: 18,
        ),
      ],
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: const EdgeInsets.all(2.0),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: const EdgeInsets.all(8.0),
    );
  }

  Random rnd = Random();

  get hobbies {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: List<Widget>.generate(widget.user.hobbies.length, (index) {
        return _buildChip(
            widget.user.hobbies[index],
            Color.fromARGB(
                255, rnd.nextInt(50), rnd.nextInt(50), rnd.nextInt(50)));
      }),
    );
  }

  get image {
    return SizedBox(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 1.65,
      child: Obx(() {
        return Hero(
            tag: widget.user.name,
            child: FadeInImage.assetNetwork(
              placeholder: AppImages.loading,
              placeholderFit: BoxFit.contain,
              image: widget.user.images[_controller.index.value],
              fit: BoxFit.cover,
              width: double.maxFinite,
            ));
      }),
    );
  }

  get imagesWidget {
    return Positioned(
      child: Center(
        child: carouselSlider,
      ),
      left: 0,
      right: 0,
      top: MediaQuery.of(context).size.height < 750
          ? MediaQuery.of(context).size.height / 2.9
          : MediaQuery.of(context).size.height / 2.6,
    );
  }

  get carouselSlider {
    return CarouselSlider.builder(
        options: CarouselOptions(
            aspectRatio: 9 / 3,
            viewportFraction: 0.3,
            initialPage: 0,
            enableInfiniteScroll: false,
            autoPlay: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal),
        itemCount: widget.user.images.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return InkWell(
            onTap: () {
              _controller.index.value = itemIndex;
            },
            child: Card(
                color: Colors.transparent,
                elevation: 17,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FadeInImage.assetNetwork(
                        placeholder: AppImages.loading,
                        placeholderFit: BoxFit.contain,
                        image: widget.user.images[itemIndex],
                        fit: BoxFit.fill))),
          );
        });
  }
}
