import '../../core/exports/view_exports.dart';

class HomeViewModel with ChangeNotifier, BaseViewModel {
  HomeViewModel() {
    doSomething();
  }

  void doSomething() async {
    setBusy(); //we check the state on the UI to show a loading spinner
    await Future.delayed(const Duration(seconds: 2));
    setIdle();
    notifyListeners();
  }
}

