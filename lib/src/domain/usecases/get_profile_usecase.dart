import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_profile_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/profile.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_profile_usecase.dart';

class GetProfileUsecase implements IGetProfileUsecase {
  @override
  Future<Profile> call() {
    return GetIt.I.get<IProfileRepository>().getProfile();
  }
}
