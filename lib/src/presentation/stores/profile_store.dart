import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_profile_usecase.dart';
import 'package:loomi_flutter_boilerplate/src/utils/misc.dart';
import 'package:mobx/mobx.dart';

import '../../external/models/profile.dart';
part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  @observable
  bool loading = false;

  @action
  Future<Profile?> getProfile() async {
    try {
      loading = true;
      return await GetIt.I.get<IGetProfileUsecase>()();
    } catch (e, s) {
      printException("ProfileStore.getProfile", e, s);
      return null;
    } finally {
      loading = false;
    }
  }
}
