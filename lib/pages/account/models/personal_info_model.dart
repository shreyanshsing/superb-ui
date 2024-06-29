import 'package:json_annotation/json_annotation.dart';

part 'personal_info_model.g.dart';

@JsonSerializable()
class PersonalInfoModel {
  const PersonalInfoModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phoneNumber,
    this.profileImage,
    this.aboutMe,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  final String? profileImage;
  final String? aboutMe;

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoModelToJson(this);
}

const mockPersonalInfo = PersonalInfoModel(
  firstName: 'Shreyansh',
  lastName: 'Singh',
  email: 'shreyanshsinghjee@gmail.com',
  phoneNumber: '+91 1234567890',
);
