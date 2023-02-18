import 'package:datingui/models/dummy.dart';
import 'package:datingui/models/response/messages/Message.dart';
import 'package:datingui/screens/otherProfile/OtherProfile.dart';
import 'package:get/get.dart';
import 'package:datingui/models/response/user/User.dart';

class ChatScreenController extends GetxController{
  RxList<MessageData> messages = <MessageData>[].obs;

  
  
  void getApi()async{
    messages.addAll(DummyData().getChat());
    messages.refresh();
   }




   @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 0)).then((value) =>   getApi() );

   }
}