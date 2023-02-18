import 'package:datingui/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:datingui/models/response/user/User.dart';
import 'package:datingui/res/colors.dart';
import 'package:datingui/res/images.dart';
import 'package:datingui/res/strings.dart';
import 'package:datingui/screens/signupModule/controller/SignupController.dart';
import 'package:datingui/screens/signupModule/controller/VerificationController.dart';
import 'package:datingui/utils/frequent_utils.dart';
import 'package:datingui/my_extensions.dart';
import 'package:datingui/widgets/custom_button.dart';

class VerificationScreen extends StatefulWidget {

  VerificationScreen() : super();

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final VerificationController _verificationController =
      Get.put(VerificationController());

  @override
  void initState() {
  //    _verificationController.user = User.fromJson(widget.res["user"]);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: text2,leading:const Padding(
        padding:  EdgeInsets.only(left: 16,top: 8,bottom: 8),
        child: BackButtonCustom(),
      ),centerTitle: true,backgroundColor: Colors.white,elevation: 0,),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height-50,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              //  32.toVerticalSpace(),


                const Spacer(),
                image,
                const Spacer(),
                text,
                const Spacer(),
                pincode,
                const Spacer(),
                resend,
                const Spacer(),
                verifyButton,
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  get pincode {
    return PinCodeTextField(
      controller: _verificationController.otpController,
      autofocus: false,
      highlight: true,
      maxLength: 4,
      hasError: false,
      pinBoxWidth: 50,
      pinBoxHeight: 64,
      wrapAlignment: WrapAlignment.spaceAround,
      pinBoxDecoration: ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
      pinTextStyle: TextStyle(fontSize: 22.0),
      pinTextAnimatedSwitcherTransition:
          ProvidedPinBoxTextAnimation.scalingTransition,
      pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
      highlightAnimationBeginColor: Get.theme.primaryColor,
      highlightAnimationEndColor: Colors.white12,
      keyboardType: TextInputType.number,
    );
  }

  get image {
    return Image.asset(AppImages.otp);
  }

  get text {
    return const Text(
      "Enter the verification code we\njust sent you on your email\naddress",
      style: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  get text2 {
    return const Text(
      "Verification",
      style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  get verifyButton {
    return CustomButton(
      showLottie: false,
      txt: "Verify",
      function: () {
        _verificationController.verifyOtpApi();
      },
    ).addOnlyPadding(left: 50, right: 50);
  }

  get resend {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Text(
          "If you didn't receive a code! ",
          style: TextStyle(color: Colors.black, fontSize: 14),
          textAlign: TextAlign.center,
        ),
        Text(
          "Resend",
          style: TextStyle(
              color: Get.theme.primaryColor, fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    ).addGesture(onClick: ()=>_verificationController.resendOtp());
  }
}
