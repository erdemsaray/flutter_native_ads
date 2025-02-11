
import 'package:flutter/material.dart';

enum ViewState { idle, busy, error }

mixin BaseViewModel on ChangeNotifier {
  ViewState _state = ViewState.idle;
  String? _errorMessage;


  ViewState get state => _state;
  String? get errorMessage => _errorMessage;

  void updateViewState(ViewState viewState, {String? message}) {
    _state = viewState;
    _errorMessage = message;
    notifyListeners();
  }

  void setIdle() => updateViewState(ViewState.idle);
  void setBusy() => updateViewState(ViewState.busy);
  void setError(String message) => updateViewState(ViewState.error, message: message);
}


