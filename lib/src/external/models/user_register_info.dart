import 'package:json_annotation/json_annotation.dart';

part 'user_register_info.g.dart';

@JsonSerializable()
class UserRegisterInfo {
  final String name;
  final String email;
  final String password;

  UserRegisterInfo({this.name = "", this.email = "", this.password = ""});

  factory UserRegisterInfo.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterInfoToJson(this);
}
