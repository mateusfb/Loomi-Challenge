import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_auth_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/auth_credentials_model.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_login_usecase.dart';

class LoginUsecase implements ILoginUseCase {
  @override
  Future<String> call(AuthCredentials authCredentials) async {
    return GetIt.I.get<IAuthRepository>().login(authCredentials);
  }
}
