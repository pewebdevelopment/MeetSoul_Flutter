import 'package:chips_choice/chips_choice.dart';
import 'package:datingui/screens/signupModule/views/SignupUpdateImageScreen.dart';
import 'package:datingui/screens/signupModule/views/introduce.dart';
import 'package:datingui/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datingui/res/colors.dart';
import 'package:datingui/res/strings.dart';
import 'package:datingui/my_extensions.dart';
import 'package:datingui/screens/signupModule/controller/SignupUpdateInfoController.dart';
import 'package:datingui/widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';

class SignupUpdateInfoScreen extends StatefulWidget {
  const SignupUpdateInfoScreen({Key? key}) : super(key: key);

  @override
  _SignupUpdateInfoScreenState createState() => _SignupUpdateInfoScreenState();
}

class _SignupUpdateInfoScreenState extends State<SignupUpdateInfoScreen> {
  final SignupUpdateInfoController _signupUpdateInfoController =
      Get.put(SignupUpdateInfoController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            back,
            22.toVerticalSpace(),
            pageView,
            nextButton(_signupUpdateInfoController.nextPage)
          ],
        ).addPadding(24),
      ),
    );
  }

  get aboutMeTextField {
    return CustomTextField(
      controller: _signupUpdateInfoController.aboutMeController,
      hint: "",
      label: "",
      min: 6,
      max: 10,
    );
  }

  get aboutMeWidget {
    return ListView(
        children: [text("About me"), 9.toVerticalSpace(), aboutMeTextField]);
  }

  get back {
    return Row(
      children: [
         BackButtonCustomWithClick(onClick: _signupUpdateInfoController.backClick),
        12.toHorizontalSpace(),
         Text(
          "Profile",
          style: TextStyle(fontSize: 18,color:Colors.black),
        )
      ],
    );
  }

  get hobbies {
    return ListView(
      children: [
        text("My Hobbies are"),
        8.toVerticalSpace(),
        ChipsChoice<String>.multiple(
            wrapped: true,
            value: _signupUpdateInfoController.selectedhobbies,
            onChanged: (val) => setState(
                () => _signupUpdateInfoController.selectedhobbies = val),
            choiceItems: _signupUpdateInfoController.hobbiesList,
            choiceStyle:  C2ChoiceStyle(
              color: Get.isDarkMode?Colors.white:primaryColor,
              brightness: Brightness.light,
              margin: EdgeInsets.all(0),
              showCheckmark: false,
              borderColor: primaryColor,
              pressElevation: 8,
            ),
            choiceActiveStyle:  C2ChoiceStyle(
              color: primaryColor,
              brightness: Brightness.dark,
            )),
      ],
    );
  }

  nextButton(Function press) {
    return Obx(
    () {
        return CustomButton(
          txt: _signupUpdateInfoController.buttonTxt.value,
          function: press,
        );
      }
    );
  }

  text(String txt) {
    return Align(
        alignment: Alignment.topLeft,
        child: Text(
          txt,
          style:
               TextStyle( color:Colors.black,fontWeight: FontWeight.w700),
        ));
  }
  
  
  get pageView{
    return Expanded(
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          UserInfoScreen(_signupUpdateInfoController),
          hobbies,
          aboutMeWidget,
          SignupUpdateImageScreenScreen(_signupUpdateInfoController)
        ],
        onPageChanged: _signupUpdateInfoController.onPageChanged,
        scrollDirection: Axis.horizontal,
        controller: _signupUpdateInfoController.controller,
      ),
    );
  }
}
