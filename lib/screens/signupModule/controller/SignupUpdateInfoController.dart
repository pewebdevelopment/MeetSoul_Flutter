import 'package:chips_choice/chips_choice.dart';
import 'package:datingui/screens/home/views/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datingui/models/response/user/User.dart';
import 'package:datingui/res/images.dart';
import 'package:datingui/res/strings.dart';
import 'package:datingui/screens/signupModule/views/SignupUpdateImageScreen.dart';
import 'package:datingui/utils/frequent_utils.dart';
import 'package:datingui/widgets/gender_picker.dart';
import 'package:image_picker/image_picker.dart';

class SignupUpdateInfoController extends GetxController{
  RxList<Gender> genders =  [Gender("Male", AppImages.man, false),Gender("Female", AppImages.girl, false),Gender("Other", AppImages.other, false)].obs;
  RxList<Gender> intrestedinlist =  [Gender("Man", AppImages.man, false),Gender("Woman", AppImages.girl, false)].obs;
  PageController controller=PageController();
  TextEditingController aboutMeController = new TextEditingController();
  RxString dob = TXT_DOB.obs;
  RxString buttonTxt = "Next".obs;
  String gender = "";
  String selectedRelation = "";
  List<String> selectedhobbies = [];
  String interestedin = "";
  RxList<String> images = ["","","",""].obs;


  List<C2Choice<String>>  relationShips = C2Choice.listFrom<String, dynamic>(
    source: relationOptions,
    value: (index, item) => item,
    label: (index, item) => item,
    meta: (index, item) => item,
  );

  List<C2Choice<String>>  hobbiesList = C2Choice.listFrom<String, dynamic>(
    source: hobbbiesOptions,
    value: (index, item) => item,
    label: (index, item) => item,
    meta: (index, item) => item,
  );
  validateStep2(){
    if(dob.value == TXT_DOB){
      FrequentUtils.getInstance().showSnackBar(MESSAGE_ENTER_DOB);
    }else if(gender.isEmpty){
      FrequentUtils.getInstance().showSnackBar(MESSAGE_SELECT_GENDER);
    }else if(selectedRelation.isEmpty){
      FrequentUtils.getInstance().showSnackBar(MESSAGE_SELECT_REALTIONSTATUS);
    }else if(selectedhobbies.isEmpty){
      FrequentUtils.getInstance().showSnackBar(MESSAGE_SELECT_HOBBY);
    }else{
      Get.offAll(()=>SignupUpdateImageScreenScreen(this));
      //    Get.to(SignupStep3Screen(this));
    }
  }



  datePicker(BuildContext context){
    FrequentUtils.getInstance().datePicker(context).then((value) {
      if(value.isNotEmpty){
        dob.value = value;
      }
    });
  }

  imagePicker(int index)async{
    String path = await  FrequentUtils.getInstance().imagerPicker(ImageSource.gallery);
    images.value[index] = path;
    images.refresh();
  }



  backClick(){
     switch(controller.page?.toInt()){
       case 0:
         Get.back();
         break;
       default:
         controller.previousPage(duration: const Duration(seconds: 1), curve: Curves.decelerate
         );
         break;
     }
  }

  onPageChanged(index){
     if(index == 3){
       buttonTxt.value = "Finish";
     }else{
       buttonTxt.value = "Next";

     }
  }

  nextPage(){
    if(controller.page?.toInt() == 3)
      {
        Get.offAll(()=>HomeScreen());
      }
    else
    controller.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate);
  }


}