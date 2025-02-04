import 'package:flutter/material.dart';
import 'package:gestion_locateur/translate/TranslationContrller.dart';
import 'package:get/get.dart';

class Settingview extends StatelessWidget {
  const Settingview({super.key});

  @override
  Widget build(BuildContext context) {
    Translationcontrller controller = Get.find();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 100),
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  controller.changelangue("fr");
                },
                child: Text("Français")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.changelangue("ar");
                },
                child: Text("العربية")),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/login");
                },
                child: Text("Connecter"))
          ],
        ),
      ),
    );
  }
}
