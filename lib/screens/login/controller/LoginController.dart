import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datingui/models/response/user/User.dart';
import 'package:datingui/res/strings.dart';
import 'package:datingui/screens/home/views/HomeScreen.dart';
import 'package:datingui/screens/signupModule/views/SignupUpdateImageScreen.dart';
import 'package:datingui/screens/signupModule/views/SignupUpdateInfoScreen.dart';
import 'package:datingui/screens/signupModule/views/verificationScreen.dart';
import 'package:datingui/utils/frequent_utils.dart';

class LoginController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  validate(){
    if(!GetUtils.isEmail(emailController.text)){
      FrequentUtils.getInstance().showSnackBar(MESSAGE_INVALID_EMAIL);
    }else if(passwordController.text.isEmpty){
      FrequentUtils.getInstance().showSnackBar(MESSAGE_INVALID_PASSWORD);
    }else{
      loginApi();
    }
  }

  void loginApi()async{
    // post({"email":emailController.text,"password":passwordController.text}, login);
    // if(res['status'] == 200 ){
    //
    //     if(res['user']['profile'] == "2"){
    //       Get.offAll(()=>HomeScreen());
    //
    //     }else  if(res['user']['profile'] == "0"){
    //         Get.offAll(()=>SignupUpdateInfoScreen());
    //     }else  if(res['user']['profile'] == "1"){
    //       Get.offAll(()=>SignupUpdateImageScreenScreen());
    //
    //     }
    // }else if(res['status'] == 300 ){
    //   Get.off(()=>VerificationScreen(res));
    // }
  }
}