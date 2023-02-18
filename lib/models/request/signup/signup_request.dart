/// name : ""
/// email : ""
/// password : ""
/// gender : ""
/// hobbies : ["wdw","ed"]

class SignupRequest {
  String _name = "";
  String _email= "";
  String _password= "";


  String get name => _name;
  String get email => _email;
  String get password => _password;


  SignupRequest({
      required String name,
      required String email,
      String password = "",
      String gender = "",
      required List<String> hobbies }){
    _name = name;
    _email = email;
    _password = password;

}

  SignupRequest.fromJson(dynamic json) {
    _name = json["name"];
    _email = json["email"];
    _password = json["password"];

  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["email"] = _email;
    map["password"] = _password;

    return map;
  }

}