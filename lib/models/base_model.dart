class BaseModel {
  int id = 0;
  String? createdAt;
  String? updatedAt;

  BaseModel({
    required this.id,
    this.createdAt,
    this.updatedAt,
  });

  BaseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
