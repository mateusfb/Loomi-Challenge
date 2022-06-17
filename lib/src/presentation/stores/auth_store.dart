import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/auth_credentials_model.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_login_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../utils/misc.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  String? email, password;

  @action
  changeEmail(String? email) => this.email = email;

  @action
  changePassword(String? password) => this.password = password;

  AuthCredentials get authCredentials =>
      AuthCredentials(email: this.email ?? '', password: this.password ?? '');

  @action
  Future<void> login() async {
    try {
      String token = await GetIt.I.get<ILoginUseCase>()(authCredentials);
    } catch (e, s) {
      printException("ExampleStore.getExample", e, s);
    }
  }
}
