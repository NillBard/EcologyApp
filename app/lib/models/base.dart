import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  String? error;
  bool isLoading = false;

  @protected
  Future<dynamic> performEffect(Future<dynamic> Function() effect) async {
    try {
      error = null;
      isLoading = true;
      await effect();
    } catch (err) {
      error = err.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
