import 'package:xtintas/src/external/models/profile.dart';

abstract class IGetProfileUsecase {
  Future<Profile> call();
}
