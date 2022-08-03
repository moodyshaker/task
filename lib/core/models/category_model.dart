class CategoryModel {
  int? mainCode;
  int? code;
  List<Data>? data;
  String? error;

  CategoryModel({this.mainCode, this.code, this.data, this.error});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? image;
  int? haveStores;
  String? createdAt;

  Data({this.id, this.name, this.image, this.haveStores, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    haveStores = json['haveStores'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['haveStores'] = this.haveStores;
    data['created_at'] = this.createdAt;
    return data;
  }
}