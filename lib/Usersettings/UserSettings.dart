import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gestion_locateur/translate/TranslationContrller.dart';
import 'package:get/get.dart';

class Usersettings extends StatelessWidget {
  final List L;
  const Usersettings({super.key, required this.L});

  @override
  Widget build(BuildContext context) {
    Translationcontrller controller = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.person_pin,
                size: 45,
              ),
              title: Text(
                L[2].toString(),
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                L[1].toString(),
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 100,
            ),
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
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  AwesomeDialog(
                          context: context,
                          dialogType: DialogType.question,
                          animType: AnimType.rightSlide,
                          title: 'Tu est sur',
                          desc: "Tu veut déconnecte",
                          btnOkOnPress: () {
                            Get.offAllNamed("/");
                          },
                          btnCancelOnPress: () {})
                      .show();
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
