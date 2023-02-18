import 'package:datingui/models/response/user/User.dart';
import 'package:datingui/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';
import 'package:story_view/widgets/story_view.dart';

class ShowStoryScreen extends StatefulWidget {
  User user;
   ShowStoryScreen(this.user,{Key? key}) : super(key: key);

  @override
  _ShowStoryScreenState createState() => _ShowStoryScreenState();
}

class _ShowStoryScreenState extends State<ShowStoryScreen> {
  final controller = StoryController();

 

  @override
  Widget build(BuildContext context) {
    List<StoryItem> storyItems = List.generate(widget.user.images.length, (index) {
            return StoryItem.pageImage(url: widget.user.images[index], controller: controller);
    });
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,leading: Padding(
        padding: const EdgeInsets.only(left: 18.0,top: 8,bottom: 8),
        child: BackButtonCustom(),
      ),),
      body: StoryView(

          controller: controller, // pass controller here too
          repeat: false, // should the stories be slid forever
          onStoryShow: (s) {

          },
          onComplete: () {
             Get.back();
          },
          onVerticalSwipeComplete: (direction) {
            if (direction == Direction.down) {
              Get.back();
            }
          }, storyItems: storyItems, // To disable vertical swipe gestures, ignore this parameter.
        // Preferrably for inline story view.
      ),
    );
  }
}
