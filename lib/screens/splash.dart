import 'package:datingui/screens/home/views/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:datingui/res/colors.dart';
import 'package:datingui/res/images.dart';
import 'package:get/get.dart';

import 'intro/views/IntroScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkIsLogin() async {
      await Future.delayed(const Duration(seconds: 3));
      Get.offAll(() => const IntroScreen());

  }

  @override
  void initState() {
    super.initState();
   // _controller = AnimationController(vsync: this);

    checkIsLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.white,
      body: Stack(
        children: [bottomWidget,text],
      ),
    );
  }
  late final AnimationController _controller;

  get lottie {
    return Lottie.asset(AppImages.lottieSplash );
  }

  get bottomWidget{
    return Align(
        alignment: Alignment.bottomLeft,
        child: CustomPaint(
            painter: FooterPainter(),
            child: SizedBox(
                width: MediaQuery.of(context).size.width, height: 300)));
  }

  get text{
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          lottie,
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            Text(
              "Meet Soul",
              style: TextStyle(color: primaryColor.withOpacity(0.8), fontSize: 23),
            ),
             Text(
              "Mate!",
              style: TextStyle(
                  color:primaryColor, fontSize: 23, fontWeight: FontWeight.bold),
            )
          ]),

        ],
      ),
    );
  }
}


class FooterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = primaryColor.withOpacity(1);
    path = Path();
    path.lineTo(size.width, size.height / 5);
    path.cubicTo(size.width, size.height / 5, size.width * 0.94,
        size.height * 0.88, size.width * 0.65, size.height * 0.93);
    path.cubicTo(size.width * 0.36, size.height * 0.97, size.width / 5,
        size.height, size.width / 5, size.height);
    path.cubicTo(size.width / 5, size.height, size.width, size.height,
        size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, size.height / 5,
        size.width, size.height / 5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
