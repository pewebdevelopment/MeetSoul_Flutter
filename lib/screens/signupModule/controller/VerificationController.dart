import 'package:datingui/utils/frequent_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datingui/models/response/user/User.dart';
import 'package:datingui/screens/signupModule/views/SignupUpdateInfoScreen.dart';


class VerificationController extends GetxController{
  //User user;
  TextEditingController otpController = TextEditingController();

  verifyOtpApi(){
    Get.offAll(()=>SignupUpdateInfoScreen());

  }

  resendOtp(){
    FrequentUtils.getInstance().showSnackBar("Sent");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    otpController.dispose();
    super.dispose();
  }
}