import 'package:xtintas/src/external/models/user_register_info.dart';

abstract class IUserRepository {
  Future<void> registerUser(UserRegisterInfo info);
}
