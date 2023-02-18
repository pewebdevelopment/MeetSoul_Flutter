import 'package:chips_choice/chips_choice.dart';
import 'package:datingui/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datingui/my_extensions.dart';
import '../../widgets/back_button.dart';
import '../../widgets/gender_picker.dart';
import 'controller/PreferenceController.dart';
class PrefScreen extends StatefulWidget {
  const PrefScreen({Key? key}) : super(key: key);

  @override
  _PrefScreenState createState() => _PrefScreenState();
}

class _PrefScreenState extends State<PrefScreen> {
  final PreferenceController _controller = Get.put(PreferenceController());

  double _lowerValue = 20.0;
  double _upperValue = 80.0;
  double _lowerValueFormatter = 20.0;
  double _upperValueFormatter = 20.0;
  double _discreteValue = 30;
  double _discreteValueheight = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent,leading: BackButtonCustom().addOnlyPadding(left: 18,top: 8,bottom: 8),title:   Text("Preferences",style: TextStyle(color:Get.isDarkMode?Colors.white:Colors.black,fontSize: 17),),elevation: 0,centerTitle: true,),

        body: ListView(
        children: [

          12.toVerticalSpace(),

          Text("Age").addTextStyle(new TextStyle(fontSize: 16)).addOnlyPadding(left: 24),
          Slider(
           activeColor: primaryColor,
            inactiveColor: primaryColor,
            value: _discreteValue,
            min: 0.0,
            max: 100.0,
            divisions: 100,
            label: '${_discreteValue.round()}',
            onChanged: (double value) {
              setState(() {
                _discreteValue = value;
              });
            },
          ),

          Text("Height").addTextStyle(new TextStyle(fontSize: 16)).addOnlyPadding(left: 24),
          Slider(
            activeColor: primaryColor,
            inactiveColor: primaryColor,
            value: _discreteValueheight,
            min: 4.0,
            max: 6.6,
            divisions: 50,
            label: '${_discreteValueheight.toPrecision(2)} cm',
            onChanged: (double value) {
              setState(() {
                _discreteValueheight = value;
              });
            },
          ),

          Text("Interested In").addTextStyle(new TextStyle(fontSize: 16)).addOnlyPadding(left: 24),
          12.toVerticalSpace(),

          interestedIn,
          12.toVerticalSpace(),

          Text("Relationship").addTextStyle(new TextStyle(fontSize: 16)).addOnlyPadding(left: 24),
          relationship,
          Text("Hobbies").addTextStyle(new TextStyle(fontSize: 16)).addOnlyPadding(left: 24),
          hobbies



        ],
      )


    );
  }
  get hobbies {
    return ListView(
      shrinkWrap: true,
      children: [
        8.toVerticalSpace(),
        ChipsChoice<String>.multiple(
            wrapped: true,
            value: _controller.selectedhobbies,
            onChanged: (val) => setState(
                    () => _controller.selectedhobbies = val),
            choiceItems: _controller.hobbiesList,
            choiceStyle:  C2ChoiceStyle(
              color: Get.isDarkMode?Colors.white:primaryColor,
              brightness: Brightness.light,
              margin: EdgeInsets.all(0),
              showCheckmark: false,
              borderColor: primaryColor,
              pressElevation: 8,
            ),
            choiceActiveStyle:  C2ChoiceStyle(
              color: primaryColor,
              brightness: Brightness.dark,
            )),
      ],
    );
  }
  text(String txt) {
    return Align(
        alignment: Alignment.topLeft,
        child: Text(
          txt,
          style:
          TextStyle( color:Colors.black,fontWeight: FontWeight.w700),
        ));
  }

  get interestedIn{
    return SizedBox(
      height: 100,
      child: Obx(
              () {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount:_controller.intrestedinlist.value.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.pinkAccent,
                    onTap: () {

                      _controller.intrestedinlist.value.forEach((gender) => gender.isSelected = false);
                      _controller.intrestedinlist.value[index].isSelected = true;
                      _controller.interestedin = _controller.intrestedinlist.value[index].name;
                      _controller.intrestedinlist.refresh();

                    },
                    child: CustomRadio(_controller.intrestedinlist.value[index]),
                  );
                });
          }
      ),
    ).addOnlyPadding(left: 24);
  }


  get relationship{
    return ChipsChoice<String>.single(
      wrapped: true,
      spinnerColor: Colors.black,
      spinnerSize: 12,
      value: _controller.selectedRelation,
      onChanged: (val) => setState(() => _controller.selectedRelation = val),
      choiceItems: _controller.relationShips,
      choiceStyle:  C2ChoiceStyle(
        color: Get.isDarkMode?Colors.white:primaryColor,
        brightness: Brightness.light,
        margin:  EdgeInsets.all(5),
        showCheckmark: false,
      ),
      choiceActiveStyle:  C2ChoiceStyle(
        color: primaryColor,
        brightness: Brightness.dark,
      ),

    );

  }
}
