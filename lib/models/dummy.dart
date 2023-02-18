import 'package:datingui/models/response/messages/Message.dart';
import 'package:datingui/models/response/notifications/notification_model.dart';
import 'package:datingui/models/response/status_model.dart';
import 'package:datingui/models/response/user/User.dart';
import 'package:datingui/res/images.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DummyData{
  String about = "Hi! My name is Mark, and I am brand new to online dating. While I’m still figuring this all out, here’s something I know for sure—I’m excited to be here! The chance to meet unique, engaging, and interesting women is pretty dang neat. If you think you might fit that mold, drop me a message";

  List<User> getUsers() {
    RxList<User> users = <User>[].obs;
    User user = User(check: true,
        hobbies: ["Travel", "Cycling"],
        relation: "Single",
        intrestedin: "Men",
        address: "London",
        name: "Ishita",
        age: "23",
        id: "1",
        images: [
          "https://pbs.twimg.com/media/EVrjjWwU8AAu-mA.jpg",
          "https://www.mrdustbin.com/wp-content/uploads/2020/09/dhrriti-saharan.jpg",
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg",
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg"
        ],
        about: about);
    User user2 = User(check: true,
        hobbies: ["Travel", "Cycling"],
        relation: "Single",
        intrestedin: "Men",
        address: "London",
        name: "Palvi",
        age: "23",
        id: "1",
        images: [
          "https://www.mrdustbin.com/wp-content/uploads/2020/09/dhrriti-saharan.jpg",
          "https://pbs.twimg.com/media/EVrjjWwU8AAu-mA.jpg",
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg",
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg"
        ],
        about: about);
    User user3 = User(check: true,
        hobbies: ["Travel", "Cycling"],
        relation: "Single",
        intrestedin: "Men",
        address: "London",
        name: "Harleen",
        age: "23",
        id: "1",
        images: [
          "https://1.bp.blogspot.com/-w5eNlISqVF8/VzaNN4y4i_I/AAAAAAAACio/DebSPqPfbwQ_s1x9lrp02RmOFGljnOk5gCLcB/s1600/Shruti%2BSodhi%2BLatest%2Bstill-%2Bindian%2Bactress%2B%25287%2529.jpg",
          "https://pbs.twimg.com/media/EVrjjWwU8AAu-mA.jpg",
          "https://www.mrdustbin.com/wp-content/uploads/2020/09/dhrriti-saharan.jpg",
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg"
        ],
        about: about);
    User user4 = User(check: true,
        hobbies: ["Travel", "Cycling"],
        relation: "Single",
        intrestedin: "Men",
        address: "London",
        name: "Tania",
        age: "23",
        id: "1",
        images: [
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg",
          "https://www.mrdustbin.com/wp-content/uploads/2020/09/dhrriti-saharan.jpg",
          "https://pbs.twimg.com/media/EVrjjWwU8AAu-mA.jpg"
        ],
        about: about);
    User user5 = User(check: true,
        hobbies: ["Travel", "Cycling"],
        relation: "Single",
        intrestedin: "Men",
        address: "London",
        name: "Sukh",
        age: "23",
        id: "1",
        images: [
          "https://i.pinimg.com/originals/76/7a/61/767a613111276c5af52eb492fd3172e9.jpg",
          "https://pbs.twimg.com/media/EVrjjWwU8AAu-mA.jpg",
          "https://www.mrdustbin.com/wp-content/uploads/2020/09/dhrriti-saharan.jpg",
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg"
        ],
        about: about);
//  User user3 = new User(address: "London",name: "Palvi",age: "23",id: "1",images: [""]);
    users.value.add(user);
    users.value.add(user2);
    users.value.add(user3);
    users.value.add(user4);
    users.value.add(user5);
    // users.value.add(user5);
    // users.value.add(user5);
    // users.value.add(user5);
    // users.value.add(user5);
    // users.value.add(user5);
    // users.value.add(user5);
    // users.value.add(user5);
    // users.value.add(user5);
    return users;
  }

  User getCurrentUser(){
    User user5 = User(check: true,
        hobbies: ["Travel", "Cycling"],
        relation: "Single",
        intrestedin: "Men",
        address: "London",
        name: "Sukh",
        age: "23",
        id: "1",
        images: [
          "https://i.pinimg.com/originals/76/7a/61/767a613111276c5af52eb492fd3172e9.jpg",
          "https://pbs.twimg.com/media/EVrjjWwU8AAu-mA.jpg",
          "https://www.mrdustbin.com/wp-content/uploads/2020/09/dhrriti-saharan.jpg",
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg"
        ],
        about: about);
    return user5;
  }



  List<Message> getMessages() {
    RxList<Message> users = <Message>[].obs;
    User user = User(check: true,
        hobbies: ["Travel", "Cycling"],
        relation: "Single",
        intrestedin: "Men",
        address: "London",
        name: "Ishita",
        age: "23",
        id: "1",
        images: [
          "https://pbs.twimg.com/media/EVrjjWwU8AAu-mA.jpg",
          "https://www.mrdustbin.com/wp-content/uploads/2020/09/dhrriti-saharan.jpg",
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg",
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg"
        ],
        about: about);
    User user2 = User(check: true,
        hobbies: ["Travel", "Cycling"],
        relation: "Single",
        intrestedin: "Men",
        address: "London",
        name: "Palvi",
        age: "23",
        id: "2",
        images: [
          "https://www.mrdustbin.com/wp-content/uploads/2020/09/dhrriti-saharan.jpg",
          "https://pbs.twimg.com/media/EVrjjWwU8AAu-mA.jpg",
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg",
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg"
        ],
        about: about);
    User user3 = User(check: true,
        hobbies: ["Travel", "Cycling"],
        relation: "Single",
        intrestedin: "Men",
        address: "London",
        name: "Harleen",
        age: "23",
        id: "1",
        images: [
          "https://1.bp.blogspot.com/-w5eNlISqVF8/VzaNN4y4i_I/AAAAAAAACio/DebSPqPfbwQ_s1x9lrp02RmOFGljnOk5gCLcB/s1600/Shruti%2BSodhi%2BLatest%2Bstill-%2Bindian%2Bactress%2B%25287%2529.jpg",
          "https://pbs.twimg.com/media/EVrjjWwU8AAu-mA.jpg",
          "https://www.mrdustbin.com/wp-content/uploads/2020/09/dhrriti-saharan.jpg",
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg"
        ],
        about: about);
    User user4 = User(check: true,
        hobbies: ["Travel", "Cycling"],
        relation: "Single",
        intrestedin: "Men",
        address: "London",
        name: "Tania",
        age: "23",
        id: "2",
        images: [
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg",
          "https://www.mrdustbin.com/wp-content/uploads/2020/09/dhrriti-saharan.jpg",
          "https://pbs.twimg.com/media/EVrjjWwU8AAu-mA.jpg"
        ],
        about: about);
    User user5 = User(check: true,
        hobbies: ["Travel", "Cycling"],
        relation: "Single",
        intrestedin: "Men",
        address: "London",
        name: "Sukh",
        age: "23",
        id: "1",
        images: [
          "https://i.pinimg.com/originals/76/7a/61/767a613111276c5af52eb492fd3172e9.jpg",
          "https://pbs.twimg.com/media/EVrjjWwU8AAu-mA.jpg",
          "https://www.mrdustbin.com/wp-content/uploads/2020/09/dhrriti-saharan.jpg",
          "https://i.pinimg.com/originals/59/8b/cb/598bcb9a876ad7ad747a81c1138083df.jpg"
        ],
        about: about);
//  User user3 = new User(address: "London",name: "Palvi",age: "23",id: "1",images: [""]);
    Message msg = Message(user, "Hi , How are you", "10 min ago");
    Message msg2 = Message(user2, "Hi , Whats'up", "1 day ago");
    Message ms3 = Message(user3, "Where are you?", "now");
    Message ms4 = Message(user4, "Are you free today?", "1 hour ago");
    Message ms5 = Message(user5, "Let's meet tomorrow", "30 min ago");
    users.value.add(msg);
    users.value.add(msg2);
    users.value.add(ms3);
    users.value.add(ms4);
    users.value.add(ms5);
    // users.value.add(user5);
    // users.value.add(user5);
    // users.value.add(user5);
    // users.value.add(user5);
    // users.value.add(user5);
    // users.value.add(user5);
    // users.value.add(user5);
    // users.value.add(user5);
    return users;
  }


  List<MessageData> getChat(){
    RxList<MessageData> msg = <MessageData>[].obs;
     MessageData data = MessageData("Hi , How are you", "10 min ago", "1");
     MessageData data2 = MessageData("Hi , Whats'up", "1 day ago", "2");
     MessageData data3 = MessageData("Where are you?", "now", "1");
     MessageData data4 = MessageData("Are you free today?", "1 hour ago", "2");
     MessageData data5 = MessageData("Let's meet tomorrow", "30 min ago", "1");
     msg.add(data);
     msg.add(data2);
     msg.add(data3);
     msg.add(data4);
     msg.add(data5);
     return msg;
}


  List<Status> getStatus(){
    RxList<Status> status = <Status>[].obs;
    Status status1 = Status(AppImages.happy, "Happy");
    Status status2 = Status(AppImages.exited, "Excited");
    Status status3 = Status(AppImages.angry, "Angry");
    Status status4 = Status(AppImages.romantic, "Romantic");


    status.add(status1);
    status.add(status2);
    status.add(status3);
    status.add(status4);




    return status;

  }



}