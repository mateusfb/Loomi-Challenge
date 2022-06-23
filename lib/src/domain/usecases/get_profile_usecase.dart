import 'package:get_it/get_it.dart';
import 'package:xtintas/src/domain/repositories/i_profile_repository.dart';
import 'package:xtintas/src/external/models/profile.dart';
import 'package:xtintas/src/presentation/usecases/i_get_profile_usecase.dart';

class GetProfileUsecase implements IGetProfileUsecase {
  @override
  Future<Profile> call() {
    return GetIt.I.get<IProfileRepository>().getProfile();
  }
}
