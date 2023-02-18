import 'package:datingui/models/response/user/User.dart';

class Message{
  User user;
  String message;
  String date;


  Message(this.user,this.message,this.date);

}

class MessageData{
  String message;
  String date;
  String id;
  MessageData(this.message,this.date,this.id);
}