import 'package:flutter/material.dart';
import 'package:datingui/res/colors.dart';
import 'package:get/get.dart';

class CustomRadio extends StatelessWidget {
  Gender _gender;

  CustomRadio(this._gender);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        color: _gender.isSelected ? Get.theme.primaryColor : Colors.white,
        child: Container(
          width: 82,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(

                _gender.icon,
               width: 32,
               height: 32,
               // color: _gender.isSelected ? Colors.white : Colors.grey,
              //  size: 40,
              ),
            //  SizedBox(height: 4),
              Text(
                _gender.name,
                style: TextStyle(
                    color: _gender.isSelected ? Colors.white : Colors.black),
              )
            ],
          ),
        ));
  }
}
class Gender {
  String name;
  String icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}