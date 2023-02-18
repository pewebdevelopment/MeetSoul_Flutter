import 'package:datingui/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:datingui/res/colors.dart';
import 'package:datingui/res/images.dart';

import 'package:datingui/screens/signupModule/controller/SignupController.dart';
import 'package:get/get.dart';
import 'package:datingui/widgets/custom_button.dart';
import 'package:datingui/widgets/custom_textfield.dart';
import 'package:datingui/my_extensions.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupController _signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            lottieTop,
            lotties,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                48.toVerticalSpace(),
                 BackButtonCustom(),
                48.toVerticalSpace(),
                upperText,
                const Spacer(),
                16.toVerticalSpace(),
                emailTextField,
                16.toVerticalSpace(),
                nextButton(_signupController.nextScreen),
                const Spacer(),
                Center(child: const Text("Or")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    circleButton(AppImages.googlee, _signupController.nextScreen),
                    circleButton(AppImages.fb, _signupController.nextScreen),

                  ],
                ),
                const Spacer(),
              ],
            ).addPadding(24),
          ],
        ),
      ),
    ));
  }

  get emailTextField {
    return CustomTextField(
      controller: _signupController.emailController,
      hint: "Enter email or phone no",
      label: "Enter email or phone no",
    );
  }

  nextButton(Function onPress) {
    return CustomButton(
      function: onPress,
      txt: "Continue",
    );
  }

  get lotties {
    return Lottie.asset(AppImages.heart);
  }

  get upperText {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Let's start",
          style: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Row(children:  [
          Text(
            "To Find your",
            style: TextStyle(color: greyTexT, fontSize: 26),
          ),
          Text(
            " Soul!",
            style: TextStyle(
                color: Get.theme.primaryColor, fontSize: 26, fontWeight: FontWeight.bold),
          )
        ]),
      ],
    );
  }

  get lottieTop {
    return Lottie.asset(AppImages.liquid);
  }


  Widget circleButton(String img , Function click){
    return   Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(6),
          child: Card(
              elevation: 6,
              shape: const CircleBorder(),
              child: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      // width: 2.0,
                    ),
                  ),
                ),
                maxRadius: 29,
                backgroundImage: AssetImage(
                    img),
              )).addGesture(onClick: () =>click()),
        ),
        Positioned.fill(child: Material(borderRadius: BorderRadius.circular(22),color: Colors.transparent,child: InkWell(splashColor: Get.theme.primaryColor.withOpacity(0.5),onTap: (){},),))
      ],
    );
  }
}
