import 'package:flutter/material.dart';
import 'package:gestion_locateur/Url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Logincontroller extends GetxController {
  late BuildContext context;
  login(var email, var password) async {
    Map<String, Object> login = {"email": email, "password": password};
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    var rep = await http.post(Uri.parse("${Url().url}/Api/auth/login"), body: login, headers: headers);
    if (rep.statusCode != 200) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Dialog Title',
        desc: 'Dialog description here.............',
        btnOkOnPress: () {},
      ).show();
    }else{
      Get.offNamed("/user/bottombar");
    }
  }
}
