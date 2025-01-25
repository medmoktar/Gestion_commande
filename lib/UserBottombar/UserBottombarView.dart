import 'package:flutter/material.dart';
import 'package:gestion_locateur/Ajoutmeson/AjouterView.dart';
import 'package:gestion_locateur/BottomNavigation/BottomController.dart';
import 'package:get/get.dart';

class UserBottombarview extends StatelessWidget {
  UserBottombarview({super.key});

  final List<Widget> screens = [
    Center(
        child: Container(
      child: Text("Page index 0"),
    )),
    Ajouterview()
  ];

  final Bottomcontroller controller = Get.put(Bottomcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Bottomcontroller>(builder: (controller) {
        return screens[controller.index];
      }),
      bottomNavigationBar: GetBuilder<Bottomcontroller>(builder: (controller) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Ajouter")
          ],
          currentIndex: controller.index,
          onTap: (i) {
            controller.changeIndex(i);
          },
        );
      }),
    );
  }
}
