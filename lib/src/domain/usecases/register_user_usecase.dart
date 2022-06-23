import 'package:get_it/get_it.dart';
import 'package:xtintas/src/external/models/user_register_info.dart';
import 'package:xtintas/src/presentation/usecases/i_register_user_usecase.dart';

import '../repositories/i_user_repository.dart';

class RegisterUserUsecase implements IRegisterUserUseCase {
  @override
  Future<void> call(UserRegisterInfo info) {
    return GetIt.I.get<IUserRepository>().registerUser(info);
  }
}
