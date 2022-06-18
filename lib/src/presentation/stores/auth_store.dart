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

  @observable
  bool loading = false, showPassword = false;

  @action
  changeEmail(String? email) => this.email = email;

  @action
  changePassword(String? password) => this.password = password;

  @action
  changePasswordVisibility() => showPassword = !showPassword;

  @computed
  AuthCredentials get authCredentials =>
      AuthCredentials(email: this.email ?? '', password: this.password ?? '');

  @action
  Future<void> login() async {
    try {
      loading = true;
      String token = await GetIt.I.get<ILoginUseCase>()(authCredentials);
      print(token);
    } catch (e, s) {
      printException("AuthStore.login", e, s);
    } finally {
      loading = false;
    }
  }
}
