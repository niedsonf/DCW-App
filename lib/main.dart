import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getmage/constants/style.dart';
import 'package:getmage/controllers/auth_controller.dart';
import 'package:getmage/controllers/dog_api_controller.dart';
import 'package:getmage/controllers/image_controller.dart';
import 'package:getmage/controllers/menu_controller.dart';
import 'package:getmage/controllers/navigation_controller.dart';
import 'package:getmage/helpers/auth_screen_controller.dart';
import 'package:getmage/layout.dart';
import 'package:getmage/pages/gallery/gallery.dart';
import 'package:getmage/pages/home/home.dart';
import 'package:getmage/pages/login/login.dart';
import 'package:getmage/routing/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(MenuController());
  Get.put(AuthController.init());
  Get.put(NavigationController());
  Get.put(ImageController());
  Get.put(DogController());
  runApp(const GetMage());
}

class GetMage extends StatelessWidget {
  const GetMage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RootRoute,
      getPages: [
        GetPage(name: RootRoute, page: () => const AuthScreenController()),
      ],
      title: 'DCW',
      theme: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(),
        scaffoldBackgroundColor: dark,
      ),
    );
  }
}
