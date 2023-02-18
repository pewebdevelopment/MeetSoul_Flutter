class CommonResponse {
  String message = "";
  int status;

  CommonResponse({required this.message, required this.status});

  factory CommonResponse.fromJson(Map<String, dynamic> json) {
    return CommonResponse(
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}