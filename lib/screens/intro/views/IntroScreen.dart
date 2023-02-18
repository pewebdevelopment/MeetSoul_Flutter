import 'package:carousel_slider/carousel_slider.dart';
import 'package:datingui/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:datingui/res/colors.dart';
import 'package:datingui/res/strings.dart';
import 'package:datingui/screens/intro/controller/intro_controller.dart';
import 'package:datingui/my_extensions.dart';
import 'package:datingui/widgets/custom_button.dart';

class IntroScreen extends StatefulWidget {
   const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final IntroController _introController = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Spacer(),
             //  50.toVerticalSpace(),
             //  const Align(
             //      alignment: Alignment.topLeft,
             //      child: Padding(
             //        padding:  EdgeInsets.only(left: 28.0),
             //        child: BackButtonCustom(),
             //      )),
             // const Spacer(),
              slider,
              indicator,
              const Spacer(),
            //  loginButton(_introController.gotoLoginScreen),
              //12.toVerticalSpace(),
              signupButton(_introController.gotoSignupScreen),
           20.toVerticalSpace(),
           //   const Spacer(),
            ],
          ),

           const Positioned(
              left: 0,top: 50,
               child: Padding(
                 padding:  EdgeInsets.only(left: 28.0),
                 child: BackButtonCustom(),
               )),
        ],
      ),
    );
  }

  loginButton(Function onPress) {
    return CustomButton(showLottie: true, function: onPress, txt: "Log In")
        .addOnlyPadding(left: 24, right: 24);
  }

  signupButton(Function onPress) {
    return CustomButton(
      showLottie: true,
      function: onPress,
      txt: "Next",
    ).addOnlyPadding(left: 24, right: 24);
  }

  get slider {
    return CarouselSlider.builder(
      options: CarouselOptions(
          height: 500,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          //  reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration:const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: (i, _) {
            _introController.index.value = i;
          }),
      itemCount: images.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Lottie.asset(images[itemIndex].img),
          ),
          Text(
            images[itemIndex].txt,
            style:const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          4.toVerticalSpace(),
          Text(images[itemIndex].txt2,
              style:const TextStyle(fontSize: 14, color: greyTexT),
              textAlign: TextAlign.center)
        ],
      ),
    );
  }

  get indicator {
    return Obx(() {
      return AnimatedSmoothIndicator(
        activeIndex: _introController.index.value,
        count: images.length,
        effect: ExpandingDotsEffect(
            activeDotColor: Get.theme.primaryColor, dotWidth: 10, dotHeight: 10),
      );
    });
  }
}

class IntroData {
  String img;
  String txt;
  String txt2;

  IntroData(this.img, this.txt, this.txt2);
}
