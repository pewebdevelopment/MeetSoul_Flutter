import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../res/colors.dart';
import '../../../res/strings.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/gender_picker.dart';
import '../controller/SignupUpdateInfoController.dart';
import 'package:datingui/my_extensions.dart';



class UserInfoScreen extends StatefulWidget {
  SignupUpdateInfoController signupUpdateInfoController;
   UserInfoScreen(this.signupUpdateInfoController,{Key? key}) : super(key: key);

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        text("My Name is"),
        9.toVerticalSpace(),
        nameTextField,
        10.toVerticalSpace(),

        text("My Dob is"),
        10.toVerticalSpace(),

        Obx( () {
          return dobField.addGesture(onClick: ()=>widget.signupUpdateInfoController.datePicker(context));
        }
        ),
        10.toVerticalSpace(),

        text("I'm a"),

        genderPicker,
        10.toVerticalSpace(),

        text("I'm interested in"),

        10.toVerticalSpace(),
        interestedIn,
        10.toVerticalSpace(),

        text("Currently I'm"),
        Container(
          child: relationship,
        ),

      ],
    );
  }

  nextButton(Function press){
    return CustomButton(txt: TXT_NEXT,function: press,);
  }
  text(String txt){
    return Align(
        alignment: Alignment.topLeft,
        child: Text(txt,style:const  TextStyle(color: Colors.black,fontWeight: FontWeight.w700),));
  }



  Widget get  dobField{
    return Row(
      children: [
        Container(padding:const EdgeInsets.only(left: 16,right: 16,top: 5,bottom: 5),decoration: BoxDecoration(border: Border.all(color: Get.theme.primaryColor,width: 1.1),borderRadius:const BorderRadius.all(Radius.circular(12))),child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
             Icon(Icons.cake,color: Get.theme.primaryColorLight,),
            8.toHorizontalSpace(),
            Text(widget.signupUpdateInfoController.dob.value),
            30.toHorizontalSpace(),
          ],
        )),
      ],
    );
  }

  get genderPicker{
    return  SizedBox(
      height: 100,
      child: Obx(
              () {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: widget.signupUpdateInfoController.genders.value.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      splashColor: Colors.pinkAccent,
                      onTap: () {

                        widget.signupUpdateInfoController.genders.value.forEach((gender) => gender.isSelected = false);
                        widget.signupUpdateInfoController.genders.value[index].isSelected = true;
                        widget.signupUpdateInfoController.gender =widget.signupUpdateInfoController.genders.value[index].name;
                        widget.signupUpdateInfoController.genders.refresh();


                      },
                      child:
                      CustomRadio(widget.signupUpdateInfoController.genders.value[index])

                  );
                });
          }
      ),
    );  }

  get interestedIn{
    return SizedBox(
      height: 100,
      child: Obx(
              () {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: widget.signupUpdateInfoController.intrestedinlist.value.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.pinkAccent,
                    onTap: () {

                      widget.signupUpdateInfoController.intrestedinlist.value.forEach((gender) => gender.isSelected = false);
                      widget.signupUpdateInfoController.intrestedinlist.value[index].isSelected = true;
                      widget.signupUpdateInfoController.interestedin = widget.signupUpdateInfoController.intrestedinlist.value[index].name;
                      widget.signupUpdateInfoController.intrestedinlist.refresh();

                    },
                    child: CustomRadio(widget.signupUpdateInfoController.intrestedinlist.value[index]),
                  );
                });
          }
      ),
    );
  }


  get relationship{
    return ChipsChoice<String>.single(
      wrapped: true,
      spinnerColor: Colors.black,
      spinnerSize: 12,
      value: widget.signupUpdateInfoController.selectedRelation,
      onChanged: (val) => setState(() => widget.signupUpdateInfoController.selectedRelation = val),
      choiceItems: widget.signupUpdateInfoController.relationShips,
      choiceStyle:  C2ChoiceStyle(
        color: Get.isDarkMode?Colors.white:primaryColor,
        brightness: Brightness.light,
        margin:  EdgeInsets.all(5),
        showCheckmark: false,
      ),
      choiceActiveStyle:  C2ChoiceStyle(
        color: primaryColor,
        brightness: Brightness.dark,
      ),

    );

  }

  get nameTextField{
    return Row(
      children: [
        Container(
          width: 200,
            height: 35,
            child: CustomTextField(contentpaddngleft: 8,contentpaddng: 0,max:1,controller: widget.signupUpdateInfoController.aboutMeController,hint:  "",label: "",)),
      ],
    );
  }
}
