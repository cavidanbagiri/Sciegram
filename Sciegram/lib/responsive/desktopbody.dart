import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sciegram/controllers/login_controller.dart';
import 'package:sciegram/routers/app_routes.dart';
import 'package:sciegram/views/desktop_body/home_page.dart';
import 'package:sciegram/views/desktop_body/login_page.dart';
import 'package:sciegram/widgets/desktop_body/appbar_widget.dart';

class DesktopBody extends StatelessWidget {
  DesktopBody({Key? key}) : super(key: key);
  // var controller = Get.lazyPut(() => LoginPageController());
  final controller = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: const Drawer(),
      // body: Center(
      //   child: Obx((){
      //     if(controller.googleAccount.value == null){
      //       return LoginPage();
      //       //return Text('some');
      //     }
      //     else{return HomePage();}
      //   }),
      // ),
      body: HomePage(),
    );
  }
}
