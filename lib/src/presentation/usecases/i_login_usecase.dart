import 'package:loomi_flutter_boilerplate/src/external/models/auth_credentials_model.dart';

abstract class ILoginUseCase {
  Future<String> call(AuthCredentials authCredentials);
}
