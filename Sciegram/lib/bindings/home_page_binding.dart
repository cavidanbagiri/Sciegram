

import 'package:get/get.dart';
import 'package:sciegram/controllers/home_page_controller.dart';

class HomePageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
  
}