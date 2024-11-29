class DashboardData {
  String? status;
  String? message;
  Result? result;

  DashboardData({this.status, this.message, this.result});

  DashboardData.fromJson(Map<String, dynamic> json) {
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
  List<Restaurant>? restaurant;
  List<Featured>? featured;
  List<Popular>? popular;
  List<Categories>? categories;

  Result({this.restaurant, this.featured, this.popular, this.categories});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['Restaurant'] != null) {
      restaurant = <Restaurant>[];
      json['Restaurant'].forEach((v) {
        restaurant!.add(new Restaurant.fromJson(v));
      });
    }
    if (json['featured'] != null) {
      featured = <Featured>[];
      json['featured'].forEach((v) {
        featured!.add(new Featured.fromJson(v));
      });
    }
    if (json['popular'] != null) {
      popular = <Popular>[];
      json['popular'].forEach((v) {
        popular!.add(new Popular.fromJson(v) );
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.restaurant != null) {
      data['Restaurant'] = this.restaurant!.map((v) => v.toJson()).toList();
    }
    if (this.featured != null) {
      data['featured'] = this.featured!.map((v) => v.toJson()).toList();
    }
    if (this.popular != null) {
      data['popular'] = this.popular!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Restaurant {
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
  Null? endDate;
  bool? fav;
  List<Images>? images;

  Restaurant(
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
        this.endDate,
        this.fav,
        this.images});

  Restaurant.fromJson(Map<String, dynamic> json) {
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
    endDate = json['end_date'];
    fav = json['fav'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
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
    data['end_date'] = this.endDate;
    data['fav'] = this.fav;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
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

class Featured {
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
  String? endDate;
  bool? fav;
  List<Images>? images;

  Featured(
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
        this.endDate,
        this.fav,
        this.images});

  Featured.fromJson(Map<String, dynamic> json) {
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
    endDate = json['end_date'];
    fav = json['fav'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
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
    data['end_date'] = this.endDate;
    data['fav'] = this.fav;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Popular {
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
  String? endDate;
  bool? fav;
  List<Images>? images;

  Popular(
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
        this.endDate,
        this.fav,
        this.images});

  Popular.fromJson(Map<String, dynamic> json) {
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
    endDate = json['end_date'];
    fav = json['fav'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
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
    data['end_date'] = this.endDate;
    data['fav'] = this.fav;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Categories {
  String? id;
  String? categoryName;
  String? image;
  String? status;

  Categories({this.id, this.categoryName, this.image, this.status});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}
