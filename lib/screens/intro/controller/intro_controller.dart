import 'package:get/get.dart';
import 'package:datingui/screens/login/view/LoginScreen.dart';
import 'package:datingui/screens/signupModule/views/SignupScreen.dart';

class IntroController extends GetxController{

  RxInt index = 0.obs;

  gotoLoginScreen(){
      Get.offAll(()=>LoginScreen());
  }


  gotoSignupScreen(){
    Get.offAll(()=>SignupScreen());

  }
}