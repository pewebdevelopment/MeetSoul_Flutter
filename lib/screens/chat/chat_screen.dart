// ignore_for_file: prefer_const_constructors

import 'package:datingui/models/dummy.dart';
import 'package:datingui/models/response/user/User.dart';
import 'package:datingui/res/colors.dart';
import 'package:datingui/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/response/messages/Message.dart';
import 'controller/ChatScreenController.dart';


class ChatScreen extends StatefulWidget {
  User user;
   ChatScreen(this.user,{Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}



class _ChatScreenState extends State<ChatScreen> {
 final ChatScreenController _controller = Get.put(ChatScreenController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return _messagesAreaWidget;
  }




  get appBar{
    return AppBar(elevation: 0,centerTitle: false,title: Text(widget.user.name,style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontSize: 17),),backgroundColor: Colors.transparent,leading: Padding(
      padding: const EdgeInsets.only(left: 18,top: 8,bottom: 8),
      child: BackButtonCustom(),
    ),);
  }


  Widget get _messagesAreaWidget {
    return Scaffold(
      appBar: appBar,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Obx(
                 () {
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: _controller.messages.length,
                      itemBuilder: (context, index) {
                        return _messageWidget(
                            isMyMessage: _controller.messages[index].id ==
                                "1",
                            messageData: _controller.messages[index],
                            );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 12);
                      },
                    );
                  }
                ),
              ),
            ),
            Divider(
              color: Get.theme.disabledColor,
              height: 1,
            ),
            _footer()
          ],
        ),
      ),
    );
  }



  Widget _messageWidget(
      {bool isMyMessage = true,
      required MessageData messageData,
      }) {
    return Row(

      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment:
                isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                margin: EdgeInsets.only(
                    right: isMyMessage ? 0 : Get.width * 0.2,
                    left: isMyMessage ? Get.width * 0.2 : 0),
                decoration: BoxDecoration(
                  color: isMyMessage
                      ? Get.theme.primaryColor.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(isMyMessage ? 0 : 16),
                    bottomLeft: Radius.circular(isMyMessage ? 16 : 0),
                  ),
                ),
                padding: EdgeInsets.all(12),
                child: Text(

                  messageData.message,
                  style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,)
                ),
              ),
              SizedBox(height: 4),
              Text(
                messageData.date,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(height: 2),
            ],
          ),
        ),
      ],
    );
  }

  Card _footer() {
    return Card(
      elevation: 0,
      child: Container(
        height: 60,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(

                decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  border: InputBorder.none,
                  hintText: "Write something here ....",
                ),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Get.theme.primaryColor),
                child: Center(
                  child: Icon(
                    Icons.double_arrow,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
