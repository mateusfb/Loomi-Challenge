import 'package:xtintas/src/external/models/auth_credentials_model.dart';

abstract class IAuthRepository {
  Future<String> login(AuthCredentials authCredentials);

  Future<void> logout();
}
