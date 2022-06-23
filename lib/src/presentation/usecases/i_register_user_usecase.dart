import 'package:xtintas/src/external/models/user_register_info.dart';

abstract class IRegisterUserUseCase {
  Future<void> call(UserRegisterInfo info);
}
