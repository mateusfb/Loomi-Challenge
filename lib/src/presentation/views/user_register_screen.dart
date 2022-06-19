import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/stores/user_store.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/widgets/custom_modal_bottom_sheet.dart';

import '../../utils/custom_colors.dart';
import '../../utils/fonts.dart';
import '../../utils/validators.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/toggle_password_visibility_button.dart';

class UserRegisterScreen extends StatefulWidget {
  const UserRegisterScreen({Key? key}) : super(key: key);

  static const routeName = 'register_user';

  @override
  State<UserRegisterScreen> createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenSize.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.center,
                colors: [
                  CustomColors.loginGradientStart,
                  CustomColors.loginGradientEnd,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -500,
            left: -100,
            child: Container(
              height: screenSize.height,
              width: screenSize.height,
              decoration: BoxDecoration(
                color: CustomColors.loginGradientStart.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: _RegisterUserForm(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _RegisterUserForm extends StatefulWidget {
  const _RegisterUserForm({Key? key}) : super(key: key);

  @override
  State<_RegisterUserForm> createState() => __RegisterUserFormState();
}

class __RegisterUserFormState extends State<_RegisterUserForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  final userStore = GetIt.I.get<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/bucket_and_paint.svg',
                color: CustomColors.primary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'XTintas',
                style: Fonts.title,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Criar conta",
            style: Fonts.subtitle,
          ),
          const SizedBox(height: 25),
          CustomFormField(
            label: 'Nome',
            controller: nameController,
            validator: Validators.requiredValidator(attribute: 'nome'),
            onChanged: userStore.changeName,
          ),
          CustomFormField(
            label: 'E-mail',
            controller: emailController,
            validator: Validators.emailValidator(),
            onChanged: userStore.changeEmail,
          ),
          Observer(
            builder: (_) => CustomFormField(
              label: 'Senha',
              obscureText: !userStore.showPassword,
              controller: passwordController,
              validator: Validators.passwordValidator(),
              onChanged: userStore.changePassword,
              suffix: TogglePasswordVisibilityButton(
                showPassword: userStore.showPassword,
                onTap: userStore.changePasswordVisibility,
              ),
            ),
          ),
          Observer(
            builder: (_) => CustomFormField(
              label: 'Confirmar senha',
              enabled:
                  userStore.password != null && userStore.password!.isNotEmpty,
              obscureText: !userStore.showPasswordConfirmation,
              controller: passwordConfirmationController,
              validator: (string) => userStore.password == null
                  ? null
                  : Validators.confirmPasswordValidator(
                      userStore.password!, string ?? ''),
              onChanged: userStore.changePasswordConfirmation,
              suffix: TogglePasswordVisibilityButton(
                showPassword: userStore.showPasswordConfirmation,
                onTap: userStore.changePasswordConfirmationVisibility,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Observer(
            builder: (context) => CustomElevatedButton(
              loading: userStore.loading,
              loadingColor: CustomColors.secondary,
              text: Text(
                "Criar conta",
                style: Fonts.loginButtonStyle,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  userStore.registerUser();
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'login', (route) => false);

                  showCustomModalBottomSheet(
                    context,
                    Text(
                      'Usuário cadastrado com sucesso!',
                      style: Fonts.bottomSheerTextStyle,
                    ),
                  );
                }
              },
              size: const Size(240, 48),
            ),
          ),
        ],
      ),
    );
  }
}
