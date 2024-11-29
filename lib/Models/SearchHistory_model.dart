class SearchHistoryModel {
  String? status;
  String? message;
  List<Resultdata>? result;

  SearchHistoryModel({this.status, this.message, this.result});

  SearchHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Resultdata>[];
      json['result'].forEach((v) {
        result!.add(new Resultdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Resultdata {
  String? id;
  String? userId;
  String? name;
  String? eventId;

  Resultdata({this.id, this.userId, this.name, this.eventId});

  Resultdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    eventId = json['event_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['event_id'] = this.eventId;
    return data;
  }
}
