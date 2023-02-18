import 'package:datingui/models/dummy.dart';
import 'package:datingui/models/response/user/User.dart';
import 'package:get/get.dart';
import 'package:datingui/screens/login/view/LoginScreen.dart';
import 'package:datingui/screens/signupModule/views/SignupScreen.dart';

class CongoController extends GetxController{

  late User user;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user = DummyData().getCurrentUser();
  }


}