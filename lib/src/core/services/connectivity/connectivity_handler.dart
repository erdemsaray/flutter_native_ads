
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../common/widgets/observable.dart';

class ConnectivityHandler {
  static final _connectivity = Connectivity();

  static final ObservableValue<bool> _isConnectedValueNotifier = ObservableValue(defaultValue: true);

  static ObservableValue<bool> get isConnectedValueNotifier {
    assert(
      _monitoring,
      'Connectivity Handler: You have forgot to start monitoring, try to do it by calling  ConnectivityHandler.startMonitoring()',
    );
    return _isConnectedValueNotifier;
  }

  static bool _monitoring = false;

  static void startMonitoring() {
    if (_monitoring) return;

    _monitoring = true;

    _connectivity.onConnectivityChanged.listen((connectivityResult) {
      _isConnectedValueNotifier.value = !_isConnectedValueNotifier.value;
      _isConnectedValueNotifier.value = connectivityResult != ConnectivityResult.none;
    });
  }
}

