import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/user_register_info.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_register_user_usecase.dart';
import 'package:loomi_flutter_boilerplate/src/utils/misc.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  String? name, email, password, passwordConfirmation;

  @observable
  bool loading = false, showPassword = false, showPasswordConfirmation = false;

  @action
  changeName(String? name) => this.name = name;

  @action
  changeEmail(String? email) => this.email = email;

  @action
  changePassword(String? password) => this.password = password;

  @action
  changePasswordConfirmation(String? passwordConfirmation) =>
      this.passwordConfirmation = passwordConfirmation;

  @action
  changePasswordVisibility() => showPassword = !showPassword;

  @action
  changePasswordConfirmationVisibility() =>
      showPasswordConfirmation = !showPasswordConfirmation;

  @computed
  UserRegisterInfo get userRegisterInfo => UserRegisterInfo(
      name: this.name ?? '',
      email: this.email ?? '',
      password: this.password ?? '');

  @action
  Future<void> registerUser() async {
    try {
      loading = true;
      await GetIt.I.get<IRegisterUserUseCase>()(userRegisterInfo);
    } catch (e, s) {
      printException("UserStore.registerUser", e, s);
    } finally {
      loading = false;
    }
  }
}
