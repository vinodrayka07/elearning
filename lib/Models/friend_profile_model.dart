class FriendProfileModel {
  String? status;
  String? message;
  List<Result>? result;

  FriendProfileModel({this.status, this.message, this.result});

  FriendProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
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

class Result {
  String? id;
  String? userName;
  String? email;
  String? password;
  String? type;
  String? countryCode;
  String? mobile;
  String? gender;
  String? dob;
  String? image;
  String? otp;
  String? accountStatus;
  String? address;
  String? lat;
  Null? long;
  String? language;
  String? updatedAt;
  String? createdAt;
  String? generalNotification;
  String? sound;
  String? vibrate;
  String? appUpdate;
  String? newTipsAvailable;
  String? newServiceAvailable;
  String? firstName;
  String? lastName;
  String? wallet;
  String? deviceId;
  List<Events>? events;

  Result(
      {this.id,
        this.userName,
        this.email,
        this.password,
        this.type,
        this.countryCode,
        this.mobile,
        this.gender,
        this.dob,
        this.image,
        this.otp,
        this.accountStatus,
        this.address,
        this.lat,
        this.long,
        this.language,
        this.updatedAt,
        this.createdAt,
        this.generalNotification,
        this.sound,
        this.vibrate,
        this.appUpdate,
        this.newTipsAvailable,
        this.newServiceAvailable,
        this.firstName,
        this.lastName,
        this.wallet,
        this.deviceId,
        this.events});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    gender = json['gender'];
    dob = json['dob'];
    image = json['image'];
    otp = json['otp'];
    accountStatus = json['account_status'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    language = json['language'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    generalNotification = json['general_notification'];
    sound = json['sound'];
    vibrate = json['vibrate'];
    appUpdate = json['app_update'];
    newTipsAvailable = json['new_tips_available'];
    newServiceAvailable = json['new_service_available'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    wallet = json['wallet'];
    deviceId = json['device_id'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['type'] = this.type;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['image'] = this.image;
    data['otp'] = this.otp;
    data['account_status'] = this.accountStatus;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['language'] = this.language;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['general_notification'] = this.generalNotification;
    data['sound'] = this.sound;
    data['vibrate'] = this.vibrate;
    data['app_update'] = this.appUpdate;
    data['new_tips_available'] = this.newTipsAvailable;
    data['new_service_available'] = this.newServiceAvailable;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['wallet'] = this.wallet;
    data['device_id'] = this.deviceId;
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  String? id;
  String? userName;
  String? email;
  String? password;
  String? type;
  String? countryCode;
  String? mobile;
  String? gender;
  String? dob;
  String? image;
  String? otp;
  String? accountStatus;
  String? address;
  String? lat;
  String? long;
  String? language;
  String? updatedAt;
  String? createdAt;
  String? generalNotification;
  String? sound;
  String? vibrate;
  String? appUpdate;
  String? newTipsAvailable;
  String? newServiceAvailable;
  String? firstName;
  Null? lastName;
  String? wallet;
  String? deviceId;

  Events(
      {this.id,
        this.userName,
        this.email,
        this.password,
        this.type,
        this.countryCode,
        this.mobile,
        this.gender,
        this.dob,
        this.image,
        this.otp,
        this.accountStatus,
        this.address,
        this.lat,
        this.long,
        this.language,
        this.updatedAt,
        this.createdAt,
        this.generalNotification,
        this.sound,
        this.vibrate,
        this.appUpdate,
        this.newTipsAvailable,
        this.newServiceAvailable,
        this.firstName,
        this.lastName,
        this.wallet,
        this.deviceId});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    gender = json['gender'];
    dob = json['dob'];
    image = json['image'];
    otp = json['otp'];
    accountStatus = json['account_status'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    language = json['language'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    generalNotification = json['general_notification'];
    sound = json['sound'];
    vibrate = json['vibrate'];
    appUpdate = json['app_update'];
    newTipsAvailable = json['new_tips_available'];
    newServiceAvailable = json['new_service_available'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    wallet = json['wallet'];
    deviceId = json['device_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['type'] = this.type;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['image'] = this.image;
    data['otp'] = this.otp;
    data['account_status'] = this.accountStatus;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['language'] = this.language;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['general_notification'] = this.generalNotification;
    data['sound'] = this.sound;
    data['vibrate'] = this.vibrate;
    data['app_update'] = this.appUpdate;
    data['new_tips_available'] = this.newTipsAvailable;
    data['new_service_available'] = this.newServiceAvailable;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['wallet'] = this.wallet;
    data['device_id'] = this.deviceId;
    return data;
  }
}