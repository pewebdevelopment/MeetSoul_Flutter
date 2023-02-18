import 'package:flutter/material.dart';
import 'package:datingui/res/colors.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController controller;
  String hint = "";
  String label = "";
  int min = 1;
  int max = 1;
  double contentpaddng = 0;
  double contentpaddngleft = 0;
   CustomTextField({this.contentpaddngleft = 22.0,this.contentpaddng = 18.0,required this.controller,required this.hint,this.label = "",this.max = 1,this.min = 1}) : super();

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  var focusedborder = OutlineInputBorder(borderSide: BorderSide(color: primaryColor,width: 1.0),borderRadius: BorderRadius.circular(8),gapPadding: 3);
  var unfocusedborder = OutlineInputBorder(borderSide: BorderSide(color: Get.isDarkMode?Colors.black:bordrTextField,width: 1.0),borderRadius: BorderRadius.circular(8),gapPadding: 3);
  @override
  Widget build(BuildContext context) {
    return TextField(
       maxLines: widget.max,
      minLines: widget.min,
      autofocus: false,
      style: TextStyle(color:Colors.black,fontSize: 13),
      controller: widget.controller,

        decoration: InputDecoration(contentPadding: EdgeInsets.only(left:widget.contentpaddngleft,top:widget.contentpaddng,bottom: widget.contentpaddng),hintText: widget.hint,border: unfocusedborder,focusedBorder: focusedborder ,labelText: widget.label,labelStyle: TextStyle(color: greyTexT,fontSize: 15),floatingLabelBehavior: FloatingLabelBehavior.always),

    );
  }
}
