import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datingui/screens/signupModule/views/verificationScreen.dart';

class SignupController extends GetxController{
  TextEditingController emailController = TextEditingController();

  nextScreen(){
    Get.off(VerificationScreen());

  }











}