import 'package:dashed_circle/dashed_circle.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datingui/my_extensions.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:stories_editor/stories_editor.dart';
import '../../res/colors.dart';
import '../../res/strings.dart';
import 'controller/MessagesListScreenController.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen>  with SingleTickerProviderStateMixin{

  final MessagesListScreenController _controller = Get.put(MessagesListScreenController());

  @override
  void initState() {
    super.initState();
    animate();

  }

  animate(){
    _controller.controller = AnimationController(vsync: this, duration:const Duration(seconds: 4))..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.controller
            .repeat(reverse: _controller.reversbool);
        _controller.reversbool =
        !_controller.reversbool;
      }
    });
    _controller.base = CurvedAnimation(parent: _controller.controller, curve: Curves.easeOut);
    _controller.reverse = Tween<double>(begin: 4.0, end: -1.0).animate(_controller.base);
    _controller.gap = Tween<double>(begin: 3.0, end: 0.0).animate(_controller.base);

    _controller.controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Scaffold(
        body: ListView(shrinkWrap: true,children: [
          17.toVerticalSpace(),
          const Text("Stories").addTextStyle( TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,
               fontSize: 20, fontWeight: FontWeight.w600)).addLeftPadding(12),

          storyList,
          const  Text(TXT_MESSAGES).addTextStyle( TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,
               fontSize: 20, fontWeight: FontWeight.w500)).addLeftPadding(12),
          messagesList
        ],),
      ),
    );
  }

  @override
  void dispose() {

    _controller.controller.dispose();

    Get.deleteAll();

    super.dispose();

  }

  get messagesList {
    return Obx(() {
      return ListView.separated(
        separatorBuilder: (_,i){
           return const Padding(
             padding:  EdgeInsets.symmetric(horizontal: 8),
             child: Divider(height: 0.6,thickness: 0.5),
           );
        },
          physics:const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: _controller.messagesList.value.length,
          itemBuilder: (context, index) {
            return messageView(index);
          });
    });
  }

  get storyList {
    return Row(
      children: [
        addStory(),
        Expanded(
          child: Obx(() {
            return Container(
              margin: const EdgeInsets.only(top: 6),
              height: 120,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const ScrollPhysics(),
                 scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _controller.matchesList.value.length,
                  itemBuilder: (context, index) {
                    return storyView(index);
                  }),
            );
          }),
        ),
      ],
    );
  }


  storyView(index){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
        strokeCap: StrokeCap.butt,
        strokeWidth: 1,
        padding: EdgeInsets.all(3),
        color: Get.theme.primaryColor,
        borderType: BorderType.Circle,
        child: Container(
            width:70.0,
            height: 105.0,
          //  padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(_controller.matchesList.value[index].images[0])
                )
            )
        ).addGesture(onClick: ()=>_controller.onMatchClick(index)),
      ),
    );
  }


  messageView(index){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Card(elevation: 6,shape:const  CircleBorder(),child: Hero(
          tag: _controller.messagesList[index].user.name,
          child: CircleAvatar(backgroundColor: Colors.white,child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ), maxRadius: 29,backgroundImage: NetworkImage(  _controller.messagesList.value[index].user.images[0]),),
        )).addGesture(onClick: ()=>_controller.onProfileClick(index)),
        12.toHorizontalSpace(),
        Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          Text(_controller.messagesList.value[index].user.name).addTextStyle( TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontSize: 15)),
          Text(_controller.messagesList.value[index].message).addTextStyle(const TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w400))
        ],).addGesture(onClick: ()=>_controller.onMessageClick(index)),
        const Spacer(),
        Text(_controller.messagesList.value[index].date).addTextStyle( TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontSize: 9,fontWeight: FontWeight.w400)),

 
      ],),
    );
  }



  get appBar {
    return AppBar(
      centerTitle: false,
      title: const Text(TXT_MESSAGES).addTextStyle(const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  addStory(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RotationTransition(
        turns: _controller.base,
        child: DashedCircle(

          gapSize: _controller.gap.value,
          dashes: 40,
          color: Get.theme.primaryColor,
          strokeWidth: 1,
          child: RotationTransition(
            turns: _controller.reverse,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundColor: Get.theme.primaryColor.withOpacity(0.5),
                radius: 30.0,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,children: const [
                  Icon(Icons.add,color: Colors.white,)
                ],),

              ),
            ),
          ),
        ),
      ),
    ).addGesture(onClick: (){
       Get.to(()=> StoriesEditor(
 giphyKey: 'QmBS1e8519d3rBqAu9LUQ4vtZUO5mBO6',
 editorBackgroundColor: Colors.black,
 middleBottomWidget:const Center(child: Text("Create Story",style: TextStyle(color: Colors.white,fontSize: 19),),),
 onDone: (uri){
    Get.back();
// // Share.shareFiles([uri]);
 },
 ));
    });
  }

}
