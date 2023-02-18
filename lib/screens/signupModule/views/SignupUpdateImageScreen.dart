import 'dart:io';

import 'package:datingui/res/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datingui/my_extensions.dart';
import 'package:datingui/res/colors.dart';
import 'package:datingui/res/strings.dart';
import 'package:datingui/screens/signupModule/controller/SignupController.dart';
import 'package:datingui/widgets/custom_button.dart';

import '../controller/SignupUpdateInfoController.dart';

class SignupUpdateImageScreenScreen extends StatefulWidget {
  SignupUpdateInfoController controller;
   SignupUpdateImageScreenScreen(this.controller) : super();

  @override
  _SignupUpdateImageScreenScreenState createState() => _SignupUpdateImageScreenScreenState();
}

class _SignupUpdateImageScreenScreenState extends State<SignupUpdateImageScreenScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            18.toVerticalSpace(),
            const Text("Upload Photos",style: TextStyle(fontSize: 20,color: Colors.black),),
            18.toVerticalSpace(),
            imagesList,
          ],
        ),
      ) ,
    );
  }
  

 Widget get imagesList{
    return Expanded(
      child: Obx(
        () {
          return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,
              itemCount: widget.controller.images.value.length,
              itemBuilder:(context,index){
                  return imageView(widget.controller.images.value[index],index)
                      .addInkwell(onClick: ()=>widget.controller.imagePicker(index));
          } );
        }
      ),
    );
  }


 Widget imageView(String url,index){
    return url.isEmpty?Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(border: Border.all(color: Get.theme.primaryColor,width: 1),borderRadius:const BorderRadius.all(Radius.circular(8))),
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.happiness,color: Colors.black.withOpacity(0.1),),
          5.toVerticalSpace(),
           Icon(Icons.add,color: Get.theme.primaryColorLight,),
        ],
      ),),
    ):Container(
      margin:const EdgeInsets.all(12),

      child: ClipRRect(    borderRadius: BorderRadius.circular(8.0),
          child: Image.file(File(url),fit: BoxFit.cover)),
    );
  }

  signupButton(Function press){
    return CustomButton(txt: "COMPLETE",function: press,showLottie: false,);
  }
}
 