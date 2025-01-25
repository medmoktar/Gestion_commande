import 'package:gestion_locateur/BottomNavigation/BottombarView.dart';
import 'package:gestion_locateur/Authentication/Authentication.dart';
import 'package:gestion_locateur/UserBottombar/UserBottombarView.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(name: "/AuthenticationView", page: () => AuthenticationView()),
        GetPage(name: "/", page: () => Bottombarview()),
        GetPage(name: "/user/bottombar", page: () => UserBottombarview())
      ],
    );
  }
}
