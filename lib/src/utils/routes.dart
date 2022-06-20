import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/example_screen.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/how_to_paint_screen.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/login_screen.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/store_screen.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/user_register_screen.dart';

final Map<String, WidgetBuilder> routes = {
  ExampleScreen.routeName: (_) => const ExampleScreen(),
  LoginScreen.routeName: (_) => const LoginScreen(),
  UserRegisterScreen.routeName: (_) => const UserRegisterScreen(),
  StoreScreen.routeName: (_) => const StoreScreen(),
  HowToPaintScreen.routeName: (_) => const HowToPaintScreen(),
};
