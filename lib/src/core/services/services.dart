
import 'package:flutter/services.dart';

import '../exports/view_exports.dart';
import '../helpers/database_helper.dart';
import 'connectivity/connectivity_handler.dart';

class Services {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    ConnectivityHandler.startMonitoring();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await EasyLocalization.ensureInitialized();
    await DatabaseHelper.instance.initializeDatabase();

    // ! uncomment this to after configuring firebase
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
  }
}
