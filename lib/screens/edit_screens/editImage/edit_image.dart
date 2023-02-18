import 'dart:io';

import 'package:flutter/material.dart';
import 'package:datingui/my_extensions.dart';
import 'package:get/get.dart';

import '../../../models/response/user/User.dart';
import '../../../res/colors.dart';
import '../../../res/images.dart';
import '../../../widgets/back_button.dart';
import '../../../widgets/custom_button.dart';
import 'controller/EditImageController.dart';
class EditImage extends StatefulWidget {
  late User user;
   EditImage(this.user,{Key? key}) : super(key: key);

  @override
  _EditImageState createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  late EditImageController editImageController ;
  @override
  void initState() {
    editImageController = Get.put(EditImageController(widget.user));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,leading: BackButtonCustom().addOnlyPadding(left: 18,top: 8,bottom: 8),title:   Text("Add Media",style: TextStyle(color:Get.isDarkMode?Colors.white:Colors.black,fontSize: 17),),elevation: 0,centerTitle: true,),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(

            children: [
              18.toVerticalSpace(),
              18.toVerticalSpace(),
              imagesList,
              save((){Get.back();})
            ],
          ),
        ),
      ) ,
    );
  }


  Widget get imagesList{
    return Obx(
            () {
          return GridView.builder(shrinkWrap: true,gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,
              itemCount: editImageController.images.value.length,
              itemBuilder:(context,index){
                return imageView(editImageController.images.value[index],index)
                    .addInkwell(onClick: ()=>editImageController.imagePicker(index));
              } );
        }
    );
  }


  Widget imageView(String url,index){
    return url.isEmpty?Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(border: Border.all(color: Get.theme.primaryColor,width: 1),borderRadius:const BorderRadius.all(Radius.circular(8))),
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.happiness,color: Colors.black.withOpacity(0.1),),
          5.toVerticalSpace(),
           Icon(Icons.add,color: Get.theme.primaryColorLight,),
        ],
      ),),
    ):Container(
      margin:const EdgeInsets.all(12),

      child: ClipRRect(    borderRadius: BorderRadius.circular(8.0),
          child: url.startsWith("http")?Stack(
            children: [
              Image.network(url,fit: BoxFit.cover,width: double.maxFinite,),
              Positioned(bottom: 0,left: 0,right: 0,child: Container(color: Colors.black.withAlpha(80),child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("Change Image",style: TextStyle(color: Colors.white,fontSize: 10),)),
              ),))

            ],
          ):Stack(
            children: [
              Image.file(File(url),fit: BoxFit.cover,width: double.maxFinite,),
              Positioned(bottom: 0,left: 0,right: 0,child: Container(color: Colors.black.withAlpha(80),child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("Change Image",style: TextStyle(color: Colors.white,fontSize: 10),)),
              ),))

            ],
          )),
    );
  }

  save(Function press){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomButton(txt: "Update",function: press,showLottie: true,),
    );
  }


}
