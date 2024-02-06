import 'package:flutter/foundation.dart';

class LoadingOverlay extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void showLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  // Static method to access without an instance of LoadingOverlay
  static void showLoadingStatic(bool isLoading) {
    // Get the current instance of LoadingOverlay and update the loading state
    LoadingOverlay loadingOverlay = LoadingOverlay();
    loadingOverlay.showLoading(isLoading);
  }
}
