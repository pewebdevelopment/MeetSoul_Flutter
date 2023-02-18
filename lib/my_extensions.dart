
import 'package:datingui/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipable_stack/swipable_stack.dart';

extension widgets_extension on Widget {


  Material addInkEffect({required Function onClick,Color color = Colors.white,double radious = 12,double elevation = 12,Color splash = primaryColor}){
      return Material(


        color: color,
        borderRadius: BorderRadius.circular(radious),
        elevation: elevation,
        child: InkWell(
          borderRadius: BorderRadius.circular(radious),
          splashColor: splash,
          child: this,
          onTap: () => onClick() ?? () {},
        ),
      );
  }



  InkWell addInkwell({required Function onClick}) {
    return InkWell(
      child: this,
      onTap: () => onClick() ?? () {},
    );
  }
  Widget addScaffoldContainer() {
    return Scaffold(
      body:Container(constraints: BoxConstraints.tight(Size(Get.width,Get.height),),child: this,),

    );
  }
  GestureDetector addGesture({required Function onClick}) {
    return GestureDetector(
      child: this,
      onTap: () => onClick() ?? () {},
    );
  }

  Padding addPadding(@required double value) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  Padding addLeftPadding(@required double value) {
    return Padding(padding: EdgeInsets.only(left: value), child: this);
  }

  Padding addRightPadding(@required double value) {
    return Padding(padding: EdgeInsets.only(right: value), child: this);
  }

  Padding addTopPadding(@required double value) {
    return Padding(padding: EdgeInsets.only(top: value), child: this);
  }

  Padding addBottomPadding(@required double value) {
    return Padding(padding: EdgeInsets.only(bottom: value), child: this);
  }

  Padding addOnlyPadding(
      {double left = 0, double right = 0, double top = 0, double bottom = 0})
  {
    return Padding(
        padding: EdgeInsets.only(
            top: top, bottom: bottom, right: right, left: left),
        child: this);
  }

  Row alignToRight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [this],
    );
  }
}

extension text_extension on Text {
  Text addTextStyle(@required TextStyle style) {
    return Text(
      this.data??"",
      style: style,
      textAlign: this.textAlign,
    );
  }
}

extension num_extension on num {
  toHorizontalSpace() {
    return SizedBox(
      width: this.toDouble(),
    );
  }

  toVerticalSpace() {
    return SizedBox(
      height: this.toDouble(),
    );
  }
}

extension bool_extension on bool {
  bool not() {
    return !this;
  }
}

extension object_extension on Object {
  bool isNullOrEmpty() {
    if (this is String)
      return ((this as String) == null || (this as String).isEmpty);
    else if (this is List)
      return ((this as List) == null || (this as List).isEmpty);
    else
      return (this == null);
  }

  bool isNotNullOrEmpty() {
    return isNullOrEmpty().not();
  }
}

class SwipeDirectionColor {
  static const right = Color.fromRGBO(70, 195, 120, 1);
  static const left = Color.fromRGBO(220, 90, 108, 1);
  static const up = Color.fromRGBO(83, 170, 232, 1);
  static const down = Color.fromRGBO(154, 85, 215, 1);
}

extension SwipeDirecionX on SwipeDirection {
  Color get color {
    switch (this) {
      case SwipeDirection.right:
        return const Color.fromRGBO(70, 195, 120, 1);
      case SwipeDirection.left:
        return const Color.fromRGBO(220, 90, 108, 1);
      case SwipeDirection.up:
        return const Color.fromRGBO(83, 170, 232, 1);
      case SwipeDirection.down:
        return const Color.fromRGBO(154, 85, 215, 1);
    }
  }
}
