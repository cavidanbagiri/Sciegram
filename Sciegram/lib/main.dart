import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sciegram/routers/app_routes.dart';
import 'package:sciegram/routers/routes.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCFMlahP3IR0vGff-OFrqECPABB5WHM6Uk",
          authDomain: "first-getx-app.firebaseapp.com",
          projectId: "first-getx-app",
          storageBucket: "first-getx-app.appspot.com",
          messagingSenderId: "900359479800",
          appId: "1:900359479800:web:2258a3fe64b332298f760d"));
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.LAYOUT_SEPERATOR,
      getPages: RoutesPage.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
