import 'package:package_info_plus/package_info_plus.dart';

class SetupFlavors {
  static final SetupFlavors _setupFlavors = SetupFlavors._internal();

  factory SetupFlavors() {
    return _setupFlavors;
  }

  SetupFlavors._internal();

  String baseUrl = "https://62968cc557b625860610144c.mockapi.io";

  Future<void> setup() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (packageInfo.packageName.contains("homolog")) {
      baseUrl = "";
    } else if (packageInfo.packageName.contains("staging")) {
      baseUrl = "";
    } else {
      baseUrl = "";
    }
  }
}
