import '../../external/models/profile.dart';

abstract class IProfileRepository {
  Future<Profile> getProfile();
}
