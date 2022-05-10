

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sciegram/routers/app_routes.dart';

class LoginPageController extends GetxController{

  var _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  //Google Sign In Method
  login() async{
   try{
     googleAccount.value = await _googleSignin.signIn();
     Get.toNamed(Routes.HOME);
   }
   catch(e){
     print('error is ${e.toString()}');
   }
  }

  //Google logout
  logout() async{
    try{
      googleAccount.value = await _googleSignin.signOut();
      print('logout working');
      print('email is ${googleAccount.value?.email.toString()}');
    }
    catch(e){
      print('${e.toString()}');
    }
  }


}