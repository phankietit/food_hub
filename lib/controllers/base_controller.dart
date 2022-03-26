import 'package:get/state_manager.dart';

abstract class BaseController extends GetxController {
  final RxBool _loading = true.obs;
  final RxString _error = ''.obs;

  bool get isLoading => _loading.value;
  bool get isError => !_loading.value && _error.value.isNotEmpty;
  String get error => _error.value;

  void onError(String error) {
    _error(error);
    _loading(false);

    update();
  }

  void updateLoading(bool _value) {
    _loading(_value);
    if (_value) {
      _error('');
    }

    update();
  }
}
