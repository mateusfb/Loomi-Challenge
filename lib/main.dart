import 'package:flutter/material.dart';
import 'package:xtintas/src/presentation/views/login_screen.dart';
import 'package:xtintas/src/presentation/views/store_screen.dart';
import 'package:xtintas/src/utils/authentication.dart';

import 'src/utils/custom_colors.dart';
import 'src/utils/routes.dart';
import 'src/utils/setups/setup_flavors.dart';
import 'src/utils/setups/setup_get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SetupFlavors setupFlavors = SetupFlavors();
  await setupFlavors.setup();
  setupGetIt();

  if (await Authentication.authenticated()) {
    runApp(
      const MyApp(
        page: StoreScreen(),
      ),
    );
  } else {
    runApp(
      const MyApp(
        page: LoginScreen(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.page}) : super(key: key);

  final Widget page;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: CustomColors.primary,
      ),
      home: page,
      routes: routes,
    );
  }
}
