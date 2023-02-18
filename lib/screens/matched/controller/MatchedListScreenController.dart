import 'package:datingui/models/dummy.dart';
import 'package:datingui/screens/otherProfile/OtherProfile.dart';
import 'package:get/get.dart';
import 'package:datingui/models/response/user/User.dart';

class MatchedListScreenController extends GetxController{
  RxList<User> matchedUsers = <User>[].obs;

  
  
  void getMatchesApi()async{
    matchedUsers.addAll(DummyData().getUsers());
    matchedUsers.refresh();
   }

   onProfileClick(index){

    Get.to(()=>OtherProfile(matchedUsers.value[index],isMatched: true,));
   }


   @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 0)).then((value) =>   getMatchesApi() );

   }
}