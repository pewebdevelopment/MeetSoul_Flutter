import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:datingui/res/colors.dart';
import 'package:datingui/res/images.dart';
import 'package:datingui/res/strings.dart';
import 'package:datingui/screens/login/controller/LoginController.dart';
import 'package:datingui/screens/signupModule/views/SignupScreen.dart';
import 'package:datingui/widgets/custom_button.dart';
import 'package:datingui/widgets/custom_textfield.dart';
import 'package:datingui/my_extensions.dart';
import '../../../widgets/back_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen() : super();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                lottieTop,
                lotties,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    42.toVerticalSpace(),
                    const BackButtonCustom(),
                    12.toVerticalSpace(),
                    upperText,
                    const Spacer(),
                    emailTextField,
                    16.toVerticalSpace(),
                    passwordTextField,
                    5.toVerticalSpace(),
                    forgotTXT,
                    28.toVerticalSpace(),
                    signInButton(_loginController.validate),
                    10.toVerticalSpace(),
                    googleLoginButton(),
                    const Spacer(),
                    signupButton(),
                  ],
                ).addPadding(24),
              ],
            ),
          ),
        ));
  }

  get lotties {
    return Lottie.asset(AppImages.heart);
  }

  get lottieTop {
    return Lottie.asset(AppImages.liquid);
  }

  get upperText {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Welcome,",
          style: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Sign in to,",
          style: TextStyle(color: greyTexT, fontSize: 26),
        ),
        Row(children:  [
          Text(
            "To Find your",
            style: TextStyle(color: greyTexT, fontSize: 26),
          ),
          Text(
            " Soul!",
            style: TextStyle(
                color: Get.theme.primaryColor, fontSize: 26, fontWeight: FontWeight.bold),
          )
        ]),
      ],
    );
  }

  get forgotTXT {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Text(
          TXT_FP,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  get emailTextField {
    return CustomTextField(
      controller: _loginController.emailController,
      hint: HINT_ENTER_EMAIL,
      label: HINT_EMAIL,
    );
  }

  get passwordTextField {
    return CustomTextField(
      controller: _loginController.passwordController,
      hint: HINT_ENTER_PASSWORD,
      label: HINT_PASSWORD,
    );
  }

  signInButton(Function onPress) {
    return CustomButton(function: onPress, txt: TXT_SIGNIN);
  }

  signupButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Text(
          "I'm a new user,",
          style: TextStyle(color: Colors.black),
        ),
        Text(
          "Sign up",
          style: TextStyle(color: Get.theme.primaryColor, fontWeight: FontWeight.bold),
        ),
      ],
    ).addGesture(onClick: () => Get.to(const SignupScreen()));
  }

  googleLoginButton() {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: greyTexT, width: 1),
              borderRadius: BorderRadius.circular(10.0)))),
      onPressed: () {},
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Colors.transparent, Colors.transparent]),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Container(
          height: 48, // min sizes for Material buttons
          alignment: Alignment.center,
          child: Stack(
            children: [
              Image.asset(AppImages.google).addPadding(12),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Continue with Google",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
