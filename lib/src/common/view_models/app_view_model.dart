import '../../core/exports/view_exports.dart';

class AppViewModel with ChangeNotifier, BaseViewModel {
  int index = 0;

  void updateIndex(int selectedIndex) {
    index = selectedIndex;
    notifyListeners();
  }
}
