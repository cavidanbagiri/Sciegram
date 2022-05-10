


import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginPageBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
  }

}