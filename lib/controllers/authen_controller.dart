import 'package:food_hub/constants/storage_key.dart';
import 'package:food_hub/controllers/base_controller.dart';
import 'package:food_hub/routes/links.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class AuthenController extends BaseController {
  final RxString _token = "".obs;
  final RxBool _isAuthenticated = false.obs;
  final _box = GetStorage();

  String get token => _token.value;
  bool get isAuthenticated => _isAuthenticated.value;

  Future<void> doSetToken(String token) async {
    updateLoading(true);
    await _box.write(AuthenStorageKey.token, token);
    _token(token);
    _isAuthenticated(true);
    updateLoading(false);
  }

  Future<void> doRemoveToken() async {
    updateLoading(true);
    await _box.remove(AuthenStorageKey.token);
    _token("");
    _isAuthenticated(false);
    updateLoading(false);
  }

  void logOut() async {
    await doRemoveToken();
    Get.offAllNamed(AppLinks.WELCOME);
  }

  void doGetToken() async {
    final String token = await _box.read(AuthenStorageKey.token);
    if (token.isNotEmpty) {
      doSetToken(token);
    }
  }

  @override
  void onInit() {
    doGetToken();
    super.onInit();
  }
}
