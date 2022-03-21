import 'package:food_hub/repositories/count_repository.dart';
import 'package:get/get.dart';

class CountController extends GetxController with StateMixin<int> {
  final repository = CountRepository();
  @override
  void onInit() {
    repository.getCount().then((resp) {
      change(resp, status: RxStatus.success());
      print("success");
    }, onError: (err) {
      print(err);
      change(
        null,
        status: RxStatus.error('Error get data'),
      );
      super.onInit();
    });
  }

  void increase() async {
    _loading();
    repository.increase(state).then((value) {
      change(value, status: RxStatus.success());
      print("success increase");
    }, onError: (err) {
      printError(info: err.toString());
      change(null, status: RxStatus.error());
    });
  }

  void decrease() async {
    _loading();
    repository.decrease(state).then((value) {
      change(value, status: RxStatus.success());
      print("success decrease");
    }, onError: (err) {
      printError(info: err.toString());
      change(null, status: RxStatus.error());
    });
  }

  void _loading() {
    change(state, status: RxStatus.loading());
  }
}
