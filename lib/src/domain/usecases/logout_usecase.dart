import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_logout_usecase.dart';

import '../repositories/i_auth_repository.dart';

class LogoutUsecase implements ILogoutUsecase {
  get authCredentials => null;

  @override
  Future<void> call() {
    return GetIt.I.get<IAuthRepository>().logout();
  }
}
