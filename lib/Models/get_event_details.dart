class GetEventDetails {
  String? status;
  String? message;
  Result? result;

  GetEventDetails({this.status, this.message, this.result});

  GetEventDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? id;
  String? title;
  String? address;
  String? lat;
  String? long;
  String? dateTime;
  String? about;
  String? categoryId;
  String? rating;
  String? userId;
  String? createdAt;
  String? link;
  String? visibleDate;
  String? recurring;
  String? status;
  String? inviteId;
  EventUser? eventUser;
  List<Images>? images;
  String? categoryName;
  List<FavUsers>? favUsers;
  int? favUsersCount;
  String? premium;

  Result(
      {this.id,
        this.title,
        this.address,
        this.lat,
        this.long,
        this.dateTime,
        this.about,
        this.categoryId,
        this.rating,
        this.userId,
        this.createdAt,
        this.link,
        this.visibleDate,
        this.recurring,
        this.status,
        this.inviteId,
        this.eventUser,
        this.images,
        this.categoryName,
        this.favUsers,
        this.favUsersCount,
        this.premium});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    dateTime = json['date_time'];
    about = json['about'];
    categoryId = json['category_id'];
    rating = json['rating'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    link = json['link'];
    visibleDate = json['visible_date'];
    recurring = json['recurring'];
    status = json['status'];
    inviteId = json['invite_id'];
    eventUser = json['event_user'] != null
        ? new EventUser.fromJson(json['event_user'])
        : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    categoryName = json['category_name'];
    if (json['fav_users'] != null) {
      favUsers = <FavUsers>[];
      json['fav_users'].forEach((v) {
        favUsers!.add(new FavUsers.fromJson(v));
      });
    }
    favUsersCount = json['fav_users_count'];
    premium = json['premium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['date_time'] = this.dateTime;
    data['about'] = this.about;
    data['category_id'] = this.categoryId;
    data['rating'] = this.rating;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['link'] = this.link;
    data['visible_date'] = this.visibleDate;
    data['recurring'] = this.recurring;
    data['status'] = this.status;
    data['invite_id'] = this.inviteId;
    if (this.eventUser != null) {
      data['event_user'] = this.eventUser!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['category_name'] = this.categoryName;
    if (this.favUsers != null) {
      data['fav_users'] = this.favUsers!.map((v) => v.toJson()).toList();
    }
    data['fav_users_count'] = this.favUsersCount;
    data['premium'] = this.premium;
    return data;
  }
}

class EventUser {
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
  String? lastName;
  String? wallet;
  String? deviceId;

  EventUser(
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

  EventUser.fromJson(Map<String, dynamic> json) {
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

class Images {
  String? id;
  String? eventId;
  String? image;

  Images({this.id, this.eventId, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event_id'] = this.eventId;
    data['image'] = this.image;
    return data;
  }
}

class FavUsers {
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
  String? lastName;
  String? wallet;
  String? deviceId;

  FavUsers(
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

  FavUsers.fromJson(Map<String, dynamic> json) {
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
