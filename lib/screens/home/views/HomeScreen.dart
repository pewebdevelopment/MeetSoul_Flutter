import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:datingui/res/colors.dart';
import 'package:datingui/res/images.dart';
import 'package:datingui/screens/matched/views/MatchedListScreen.dart';
import 'package:datingui/screens/swipeCard/view/SwipeCardScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:datingui/my_extensions.dart';
import 'package:datingui/screens/home/controller/home_controller.dart';
import 'package:get/get.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen() : super();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,

      bottomNavigationBar: botmbar,
      body: Container(child: Obx(
        () {
          return _homeController.currentIndex.value==0?_homeController.currentWidget:_homeController.currentIndex.value==1?_homeController.matchWidget:_homeController.currentIndex.value==2?_homeController.messagesWidget:_homeController.profileWidget;
        }
      ),),
    );
  }

  get botmbar{
    return Container(
     // color: Colors.transparent,
      margin: EdgeInsets.only(bottom: 16),
      child: Obx(
         () {
          return CustomNavigationBar(
            borderRadius: Radius.circular(25),
            elevation: 9,
            isFloating: true,
            iconSize: 26.0,
            selectedColor: Get.theme.primaryColorLight,
            strokeColor: Colors.pink,
            unSelectedColor: Colors.white,
            backgroundColor: Get.theme.primaryColor.withOpacity(0.7),
            items: [
              CustomNavigationBarItem(

                icon: Image.asset(AppImages.home,color: _homeController.currentIndex.value!=0?Colors.white:Colors.pink,),

              ),
              CustomNavigationBarItem(
                icon: Image.asset(AppImages.love,color: _homeController.currentIndex.value!=1?Colors.white:Colors.pink,),

              ),

              CustomNavigationBarItem(
                showBadge: true,
                badgeCount: 12,
                icon: Image.asset(AppImages.chat,color: _homeController.currentIndex.value!=2?Colors.white:Colors.pink,),

              ),
              CustomNavigationBarItem(
                icon: Image.asset(AppImages.settings,color: _homeController.currentIndex.value!=3?Colors.white:Colors.pink,),

              ),
            ],
            currentIndex: _homeController.currentIndex.value,
              onTap: _homeController.onClickTab,

          );
        }
      ),
    );
  }

  get bottomBar{
    return Obx(
            () {
        return BubbleBottomBar(
          opacity: .2,
          currentIndex: _homeController.currentIndex.value,
          onTap: _homeController.onClickTab,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          hasNotch: true, //new
          hasInk: true ,//new, gives a cute ink effect
          inkColor: Colors.black12, //optional, uses theme color if not specified
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(backgroundColor: Colors.red, icon: Lottie.network("https://assets3.lottiefiles.com/packages/lf20_8elcqxrg.json"), activeIcon: Lottie.network("https://assets3.lottiefiles.com/packages/lf20_8elcqxrg.json"), title: Text("Home")),
            BubbleBottomBarItem(backgroundColor: Colors.indigo, icon: Lottie.network("https://assets9.lottiefiles.com/packages/lf20_nc0bjhfi.json"), activeIcon: Lottie.network("https://assets9.lottiefiles.com/packages/lf20_nc0bjhfi.json"), title: Text("Chat")),
            BubbleBottomBarItem(backgroundColor: Colors.deepPurple, icon: Lottie.network("https://assets10.lottiefiles.com/packages/lf20_1iinz8vv.json"), activeIcon: Lottie.network("https://assets10.lottiefiles.com/packages/lf20_1iinz8vv.json"), title: Text("Video")),

            BubbleBottomBarItem(backgroundColor: Colors.green, icon: Lottie.network("https://assets9.lottiefiles.com/private_files/lf30_k3ymitp9.json").addPadding(6), activeIcon: Lottie.network("https://assets9.lottiefiles.com/private_files/lf30_k3ymitp9.json").addPadding(6), title: Text("Profile"))
          ],
        );
      }
    );
  }
}
