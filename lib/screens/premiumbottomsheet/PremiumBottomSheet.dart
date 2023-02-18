
import 'package:datingui/res/images.dart';
import 'package:datingui/res/strings.dart';
import 'package:datingui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:datingui/my_extensions.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../res/colors.dart';

class PremiumBottomSheet extends StatefulWidget {
  const PremiumBottomSheet({Key? key}) : super(key: key);

  @override
  _PremiumBottomSheetState createState() => _PremiumBottomSheetState();
}

class _PremiumBottomSheetState extends State<PremiumBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          color:  Colors.white ,
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,

          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.toVerticalSpace(),

                Row(children: [
                  Text("Soulmate").addTextStyle(TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18,fontStyle: FontStyle.italic)),
                  8.toHorizontalSpace(),
                  PhysicalModel(
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                    color: Colors.transparent,
                    elevation: 1,
                    child: Container(child: Padding(
                      padding: const EdgeInsets.only(left: 7.0,right: 7),
                      child: Shimmer.fromColors(baseColor: Colors.white,highlightColor: Colors.grey[500]!,child: Text("PREMIUM").addTextStyle(TextStyle(color: Colors.white,fontWeight: FontWeight.w100))),
                    ),decoration: BoxDecoration(gradient: LinearGradient(colors: [Get.theme.primaryColor,Get.theme.primaryColorLight]),borderRadius: BorderRadius.all(Radius.circular(18))),padding: EdgeInsets.all(5),),
                  )
                ],),
                12.toVerticalSpace(),
                Text("\$20/Month",style: TextStyle( decoration:
                TextDecoration.lineThrough,),),
                Text("\$10/Month").addTextStyle(TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 17)),
                7.toVerticalSpace(),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Get unlimited scrolling by joining '),
                      TextSpan(
                        text: '${APP_NAME} Premium ',
                        style: TextStyle(color: Get.theme.primaryColor,fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: 'Get '),
                      TextSpan(text: '50% off',style: TextStyle(color: Get.theme.primaryColor,fontWeight: FontWeight.w600)),
                      TextSpan(text: ' for your first month!'),
                    ],
                  ),
                ),
                20.toVerticalSpace(),
                row("Unlimited Scrolling"),
                8.toVerticalSpace(),
                row("See who Liked you"),
                8.toVerticalSpace(),

                row("Remove ads"),
                8.toVerticalSpace(),

                row("Get 4 Super likes every day"),
                8.toVerticalSpace(),

                row("Change location"),
                20.toVerticalSpace(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(function: (){
                    Get.back();
                  },showLottie: true,txt: "Get Premium",),
                )


              ],
            ),





          ],
        ),
      ),
    );
  }
  
 Widget row(txt){
    return   Row(children: [Image.asset(AppImages.checked,color: Get.theme.primaryColor,width: 18,height: 18,),
      6.toHorizontalSpace(),
      Text(txt).addTextStyle(TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500)),
    ],);
  }
}
