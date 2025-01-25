import 'package:flutter/material.dart';
import 'package:gestion_locateur/Url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Registercontroller extends GetxController {
  late BuildContext context;
  register(var email, var password) async {
    Map<String, Object> login = {"email": email, "password": password};
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    var rep = await http.post(Uri.parse("${Url().url}/Api/auth/register"),
        body: login, headers: headers);
    if (rep.statusCode != 200) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: "cette email a d'èja pris",
        btnOkOnPress: () {},
      ).show();
    }
  }
}
