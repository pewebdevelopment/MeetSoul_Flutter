import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:datingui/res/colors.dart';


class FrequentUtils {
   static late FrequentUtils _instance;

  static FrequentUtils getInstance() {
      _instance = new FrequentUtils();

    return _instance;
  }

  showSnackBar(String message){
    Get.rawSnackbar(
        borderRadius: 8,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Get.theme.primaryColorLight.withOpacity(0.7),
        snackPosition: SnackPosition.TOP,
        messageText: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            )),
        margin: const EdgeInsets.all(30));
  }

  Future <String> datePicker(BuildContext context)async{
  DateTime? dateTime = await  showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days:  365*18)),
      firstDate: DateTime.now().subtract(const Duration(days:  365*70)),
      lastDate: DateTime.now().subtract(const Duration(days:  365*18))
    );
  if(dateTime == null){
    return "";
  }

  return DateFormat('dd/MM/yyyy').format(dateTime);

  }


  Future<String> imagerPicker(ImageSource source)async{
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);
    return image?.path??"";
  }


  showLoader(){
    Get.dialog(const CircularProgressIndicator(),barrierDismissible: false);
  }
}