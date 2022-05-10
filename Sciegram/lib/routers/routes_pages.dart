
import 'package:get/get.dart';
import 'package:sciegram/bindings/login_page_bindings.dart';
import 'package:sciegram/bindings/post_research_binding.dart';
import 'package:sciegram/routers/app_routes.dart';
import 'package:sciegram/utils/layout_seperator.dart';
import 'package:sciegram/views/desktop_body/each_research_page.dart';
import 'package:sciegram/views/desktop_body/login_page.dart';
import 'package:sciegram/views/desktop_body/post_research_page.dart';

import '../bindings/home_page_binding.dart';
import '../views/desktop_body/home_page.dart';

class RoutesPage{
  static final pages = [
    GetPage(name: Routes.LAYOUT_SEPERATOR, page: ()=> LayoutSeperator()),
    GetPage(name: Routes.HOME, page: ()=> HomePage(), binding: HomePageBinding()),
    GetPage(name: Routes.POSTRESEARCH, page: ()=> PostResearch(), binding: PostResearchBindings()),
    GetPage(name: Routes.LOGIN, page: ()=> LoginPage(), binding:  LoginPageBindings()),
    GetPage(name: Routes.RESEARCH, page: ()=> EachResearchPage()),
  ];
}
