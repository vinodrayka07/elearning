class SendOtpModel {
  String? status;
  String? message;
  var result;

  SendOtpModel({this.status, this.message, this.result});

  SendOtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['result'] = result;
    return data;
  }
}
