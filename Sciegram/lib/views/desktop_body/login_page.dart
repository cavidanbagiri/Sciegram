
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sciegram/controllers/login_controller.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx((){
          if(controller.googleAccount.value == null){
            return ElevatedButton(
              onPressed: (){
                controller.login();
              },
              child: Text('Google Sign In'),
            );
          }
          else{return Text('username is ${controller.googleAccount.value?.displayName}');}
        }),
      ),
    );
  }
}

