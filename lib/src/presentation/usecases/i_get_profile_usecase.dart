import 'package:loomi_flutter_boilerplate/src/external/models/profile.dart';

abstract class IGetProfileUsecase {
  Future<Profile> call();
}
