import 'package:json_annotation/json_annotation.dart';

part 'auth_credentials_model.g.dart';

@JsonSerializable()
class AuthCredentials {
  String email, password;

  AuthCredentials({this.email = '', this.password = ''});

  Map<String, dynamic> toJson() => _$AuthCredentialsToJson(this);
}
