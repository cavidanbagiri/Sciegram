

import 'package:get/get.dart';
import 'package:sciegram/controllers/post_research_controller.dart';

class PostResearchBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PostResearchController());
  }

}
