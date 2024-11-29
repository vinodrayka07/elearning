class GetEvents {
  String? status;
  String? message;
  List<Result>? result;

  GetEvents({this.status, this.message, this.result});

  GetEvents.fromJson(Map<String, dynamic> json) {
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
  List<Images>? images;
  bool? fav;
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
        this.images,
        this.fav,
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
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    fav = json['fav'];
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
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['fav'] = this.fav;
    data['premium'] = this.premium;
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
