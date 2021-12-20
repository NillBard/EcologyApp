import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  var _isLoading = false;
  String? _error;

  get isLoading => _isLoading;

  get error => _error;

  clearError() {
    _error = null;
  }

  @protected
  performEffect(Future<void> Function() effect) async {
    try {
      _error = null;
      await effect();
    } catch (err) {
      _error = err.toString();
    } finally {
      notifyListeners();
    }
  }
}
