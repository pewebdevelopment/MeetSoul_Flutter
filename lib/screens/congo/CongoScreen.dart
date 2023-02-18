import 'package:datingui/res/colors.dart';
import 'package:datingui/screens/chat/chat_screen.dart';
import 'package:datingui/widgets/back_button.dart';
import 'package:datingui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:datingui/my_extensions.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:neumorphic_container/neumorphic_container.dart';

import '../../models/response/user/User.dart';
import 'controller/congp_controller.dart';
class CongoScreen extends StatefulWidget {
  User user;
   CongoScreen(this.user, {Key? key}) : super(key: key);

  @override
  _CongoScreenState createState() => _CongoScreenState();
}

class _CongoScreenState extends State<CongoScreen> {

 final CongoController _controller = Get.put(CongoController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.black,height: Get.height,width: Get.width,child: Image.network(widget.user.images[0],fit: BoxFit.cover,)),
        Container(color: Colors.black.withOpacity(0.8),height: Get.height,width: Get.width),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
             child: Container(
               padding:const  EdgeInsets.symmetric(vertical: 18,horizontal: 18),
                height: MediaQuery.of(context).size.height,
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    32.toVerticalSpace(),
                    Row(
                      children:const  [
                        BackButtonCustom(),
                      ],
                    ),
                   const  Spacer(),
                    congoText,
                    const Spacer(),
                    images,
                    const Spacer(),

                    nameText,
                    const Spacer(),

                    text,
                    const  Spacer(),
                    sayHiBT,
                   // Spacer(),
                  ],
                ),
              )
          ),
        ),

      ],
    );
  }

  get images{
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Stack(children: [
          Container(
            margin:  EdgeInsets.only(right: 112),

            child: NeumorphicContainer(

                customRadius: BorderRadius.circular(70),
                primaryColor: Color(0xfff0f0f0),
                curvature: Curvature.concave,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(maxRadius: 65,backgroundImage: NetworkImage(_controller.user.images[0]),),
            )),
          ),
         
          Container(
            margin:const EdgeInsets.only(left: 112),
            child: NeumorphicContainer(

                customRadius: BorderRadius.circular(70),
                primaryColor:const Color(0xfff0f0f0),
                curvature: Curvature.concave,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(maxRadius: 65,backgroundImage: NetworkImage(widget.user.images[0]),),
            )),
          ),
        ],)

      ],
    );
  }


  get congoText{
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Congratulations").addTextStyle(const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("It's a ").addTextStyle(const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white)),
            Stack(
              children: [
                Transform.rotate(
                    angle: 15 * math.pi / -390,
                    child: Container(color: Get.theme.primaryColor,width: 100,height: 40,)
                ),
                 SizedBox(width: 100,height: 40,child: Center(child:const Text("match").addTextStyle(const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold)))),

              ],
            ),
        ],),

      ],
    );
  }


  get nameText{
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text(widget.user.name).addTextStyle(const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
        Text(", "+widget.user.age).addTextStyle(const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
      ],
    );
  }


  get text{
    return const Text("Let's ask her about something\ninterested, or you can just say Hi\nfor initial e-meet",textAlign: TextAlign.center).addTextStyle(const TextStyle(
        color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),);
  }
  
  get sayHiBT{
    return CustomButton(function: ()=>Get.to(()=>ChatScreen(widget.user)),txt: "Say Hi");
  }
}
