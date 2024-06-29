import 'package:video_streaming_ui/models/base_model.dart';

class UserModel extends BaseModel {
  String firstName = '';
  String lastName = '';
  String email = '';

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required super.id,
    super.createdAt,
    super.updatedAt,
  });

  UserModel.fromJson(super.json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        super.fromJson();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    return data;
  }
}
