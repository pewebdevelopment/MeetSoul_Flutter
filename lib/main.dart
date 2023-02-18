import 'package:datingui/screens/chat/chat_screen.dart';
import 'package:datingui/screens/congo/CongoScreen.dart';
import 'package:datingui/screens/intro/views/IntroScreen.dart';
import 'package:datingui/screens/login/view/LoginScreen.dart';
import 'package:datingui/screens/matched/views/MatchedListScreen.dart';
import 'package:datingui/screens/messages/messages_screen.dart';
import 'package:datingui/screens/myprofile/profile_screen.dart';
import 'package:datingui/screens/notifications/notifications_screen.dart';
import 'package:datingui/screens/otherProfile/OtherProfile.dart';
import 'package:datingui/screens/preferences/PreferencesScreen.dart';
import 'package:datingui/screens/premiumbottomsheet/PremiumBottomSheet.dart';
import 'package:datingui/screens/settings/setting_screen.dart';
import 'package:datingui/screens/signupModule/views/SignupScreen.dart';
import 'package:datingui/screens/signupModule/views/SignupUpdateInfoScreen.dart';
import 'package:datingui/screens/signupModule/views/introduce.dart';
import 'package:datingui/screens/splash.dart';
import 'package:datingui/screens/swipeCard/view/SwipeCardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:datingui/res/colors.dart';
import 'package:datingui/screens/home/views/HomeScreen.dart';
import 'package:stories_editor/stories_editor.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    statusBarColor: Colors.transparent// navigation bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      theme: ThemeData.light().copyWith(

        primaryColor: primaryColor,
      primaryColorLight: primaryColorLight,

        backgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,

          ),

      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
          primaryColorLight: Colors.black38,
        backgroundColor: Colors.black,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          )

      ),
      // theme: ThemeData(Get.theme.primaryColor: Get.theme.primaryColor,textTheme: GoogleFonts.poppinsTextTheme(
      //     Theme.of(context).textTheme,

  //  )),
       home:SplashScreen()
       ,
    );
  }
}


// StoriesEditor(
// giphyKey: 'QmBS1e8519d3rBqAu9LUQ4vtZUO5mBO6',
// editorBackgroundColor: Colors.black,
// middleBottomWidget: Container(child: Center(child: Text("Create Story",style: TextStyle(color: Colors.white,fontSize: 19),),),),
// onDone: (uri){
//
// // Share.shareFiles([uri]);
// },
// )