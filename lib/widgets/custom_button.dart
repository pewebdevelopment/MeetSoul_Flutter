import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:datingui/res/colors.dart';
import 'package:datingui/my_extensions.dart';
import 'package:datingui/res/images.dart';



class CustomButton extends StatefulWidget {
  Function function;
  String txt;
  Gradient gradient;
  bool showLottie;

   CustomButton({this.showLottie = true,required this.function,this.txt="",this.gradient = const  LinearGradient(
       colors: <Color>[
         primaryColor,
         Color(0xffFDA58E)
       ]

   )}) : super();

  @override
  _CustomButtonState createState() => _CustomButtonState();
}
// Get.theme.primaryColor,
// Color(0xffFDA58E)
class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle( padding: MaterialStateProperty.all(EdgeInsets.all(0)),shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),
      onPressed: () {
        widget.function();
      },

      child: Ink(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Get.theme.primaryColor,
              Color(0xffFDA58E)
              ]

          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Container(
          height: 48, // min sizes for Material buttons
          alignment: Alignment.center,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.txt,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              widget.showLottie?Lottie.asset(AppImages.button):Container()
            ],
          ).addPadding(6),
        ),
      ),
    );
  }
}
