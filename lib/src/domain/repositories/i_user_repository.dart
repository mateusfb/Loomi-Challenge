import 'package:loomi_flutter_boilerplate/src/external/models/user_register_info.dart';

abstract class IUserRepository {
  Future<void> registerUser(UserRegisterInfo info);
}
