class User {
    bool check;
    String relation;
    String intrestedin;
    String about;
    String id;
    String name;
    String address;
        String age;
   // List<String> dislikes;
 //   String email;
 //   String gender;
    List<String> hobbies;
    List<String> images;
    // bool isVerified;
    // String latitude;
    // List<String> likes;
    // int limit;
    // String livingin;
    // String longtitude;

    // String school;
    // String sexualOrt;
    // String showMe;
    // bool showmyAge;
    // bool showmyDistance;
    // String username;


    User({required this.check,required this.hobbies,required this.relation,required this.intrestedin,required this.about,required this.address,required this.age,required this.name,required this.id,required this.images});

    // Map<String, dynamic> toJson() {
    //     final Map<String, dynamic> data = new Map<String, dynamic>();
    //     data['_id'] = this.id;
    //     data['relation'] = this.relation;
    //     data['profile'] = this.profile;
    //     data['about'] = this.about;
    //     data['age'] = this.age;
    //     data['company'] = this.company;
    //     data['deviceid'] = this.deviceid;
    //     data['email'] = this.email;
    //     data['gender'] = this.gender;
    //     data['isVerified'] = this.isVerified;
    //     data['latitude'] = this.latitude;
    //     data['limit'] = this.limit;
    //     data['livingin'] = this.livingin;
    //     data['longtitude'] = this.longtitude;
    //     data['name'] = this.name;
    //     data['school'] = this.school;
    //     data['sexualOrt'] = this.sexualOrt;
    //     data['showMe'] = this.showMe;
    //     data['showmyAge'] = this.showmyAge;
    //     data['showmyDistance'] = this.showmyDistance;
    //     data['username'] = this.username;
    //     if (this.dislikes != null) {
    //         data['dislikes'] = this.dislikes;
    //     }
    //     if (this.hobbies != null) {
    //         data['hobbies'] = this.hobbies;
    //     }
    //     if (this.images != null) {
    //         data['images'] = this.images;
    //     }
    //     if (this.likes != null) {
    //         data['likes'] = this.likes;
    //     }
    //     return data;
    // }
}