class SliderModel {
  int? mainCode;
  int? code;
  List<Data>? data;
  String? error;

  SliderModel({this.mainCode, this.code, this.data, this.error});

  SliderModel.fromJson(Map<String, dynamic> json) {
    mainCode = json['mainCode'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mainCode'] = this.mainCode;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  int? adminId;
  String? link;
  int? categoryId;
  String? image;
  int? status;
  String? typeOfAdvertisement;
  String? createdAt;

  Data(
      {this.id,
      this.userId,
      this.adminId,
      this.link,
      this.categoryId,
      this.image,
      this.status,
      this.typeOfAdvertisement,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    adminId = json['admin_id'];
    link = json['link'];
    categoryId = json['category_id '];
    image = json['image'];
    status = json['status'];
    typeOfAdvertisement = json['type_of_advertisement'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['admin_id'] = this.adminId;
    data['link'] = this.link;
    data['category_id '] = this.categoryId;
    data['image'] = this.image;
    data['status'] = this.status;
    data['type_of_advertisement'] = this.typeOfAdvertisement;
    data['created_at'] = this.createdAt;
    return data;
  }
}
