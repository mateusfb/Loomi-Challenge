import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/stores/auth_store.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/fonts.dart';
import 'package:loomi_flutter_boilerplate/src/utils/validators.dart';

import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/toggle_password_visibility_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = "login";
  static final _formKey = GlobalKey<FormState>();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: _LoginForm(formKey: LoginScreen._formKey),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  _LoginForm({Key? key, required this.formKey}) : super(key: key);

  GlobalKey<FormState> formKey;

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final authStore = GetIt.I.get<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
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
            "Entrar na plataforma",
            style: Fonts.subtitle,
          ),
          const SizedBox(height: 25),
          CustomFormField(
            label: 'E-mail',
            controller: emailController,
            validator: Validators.emailValidator(),
            onChanged: authStore.changeEmail,
          ),
          Observer(
            builder: (_) => CustomFormField(
              label: 'Senha',
              obscureText: !authStore.showPassword,
              controller: passwordController,
              validator: Validators.passwordValidator(),
              onChanged: authStore.changePassword,
              suffix: TogglePasswordVisibilityButton(
                showPassword: authStore.showPassword,
                onTap: authStore.changePasswordVisibility,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          CustomElevatedButton(
            text: Text(
              "Login",
              style: Fonts.loginButtonStyle,
            ),
            onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                authStore.login();
              }
            },
            size: const Size(240, 48),
          ),
          CustomElevatedButton(
            text: Text(
              "Criar conta",
              style: Fonts.createAccountButtonStyle,
            ),
            fillColor: Colors.transparent,
            onPressed: () {
              Navigator.pushNamed(context, 'register_user');
            },
            size: const Size(240, 48),
          )
        ],
      ),
    );
  }
}
