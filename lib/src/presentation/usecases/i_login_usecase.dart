import 'package:xtintas/src/external/models/auth_credentials_model.dart';

abstract class ILoginUseCase {
  Future<String> call(AuthCredentials authCredentials);
}
