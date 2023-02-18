import 'package:datingui/models/response/user/User.dart';
import 'package:datingui/widgets/back_button.dart';
import 'package:datingui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:datingui/my_extensions.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_textfield.dart';
class EditAbout extends StatefulWidget {
  late User user;
   EditAbout(this.user,{Key? key}) : super(key: key);

  @override
  State<EditAbout> createState() => _EditAboutState();
}

class _EditAboutState extends State<EditAbout> {
 late TextEditingController _editingController;

  @override
  void initState() {
    _editingController = TextEditingController(text: widget.user.about);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,leading: BackButtonCustom().addOnlyPadding(left: 18,top: 8,bottom: 8),title:   Text("Edit bio",style: TextStyle(color:Get.isDarkMode?Colors.white:Colors.black,fontSize: 17),),elevation: 0,centerTitle: true,),
      body: aboutMeWidget,
    );
  }

  get aboutMeWidget {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
          children: [text("About me",), 9.toVerticalSpace(), aboutMeTextField,20.toVerticalSpace(),save],
      ),
    );
  }

  text(String txt) {
    return Align(
        alignment: Alignment.topLeft,
        child: Text(
          txt,
          style:
           TextStyle(color:Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.w700),
        ));
  }

  get aboutMeTextField {
    return CustomTextField(
      controller: _editingController,
      hint: "",
      label: "",
      min: 6,
      max: 10,
    );
  }

  get save {
    return CustomButton(function: ()=>Get.back(),txt: "Update",showLottie: true,);
  }
}
