import 'package:datingui/models/response/user/User.dart';

class Notification{
  String title = "";
  String time  = "";
  User user;
  Notification(this.user,this.time,this.title);
}