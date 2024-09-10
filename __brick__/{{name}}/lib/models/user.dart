import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class UserModel {
  final String? id;
  final String? email;
  final String? fullName;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromMap(Map<Object, Object?> map) {
    return UserModel(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
    };
  }

  Map<String, dynamic> toMapWithoutNulls() {
    final map = toMap();
    map.removeWhere((key, value) => value == null);
    return map;
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel({
    this.id,
    this.email,
    this.fullName,
  });
}
