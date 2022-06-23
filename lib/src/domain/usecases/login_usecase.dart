import 'package:get_it/get_it.dart';
import 'package:xtintas/src/domain/repositories/i_auth_repository.dart';
import 'package:xtintas/src/external/models/auth_credentials_model.dart';
import 'package:xtintas/src/presentation/usecases/i_login_usecase.dart';

class LoginUsecase implements ILoginUseCase {
  @override
  Future<String> call(AuthCredentials authCredentials) async {
    return GetIt.I.get<IAuthRepository>().login(authCredentials);
  }
}
