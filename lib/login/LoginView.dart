import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gestion_locateur/login/LoginController.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Loginview extends StatelessWidget {
  Loginview({super.key});
  late TextEditingController email = TextEditingController();
  late TextEditingController pass = TextEditingController();
  final Logincontroller controller = Get.put(Logincontroller());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Login",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 31, color: Colors.white),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Email",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    hintText: "Entrer ton Email",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    )),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Mot de pass",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    hintText: "Entrer ton mot de pass",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    )),
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              if (email.text.isEmpty) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Erreur',
                  desc: 'Email est obligatoire',
                  btnOkOnPress: () {},
                ).show();
              } else if (pass.text.isEmpty) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Erreur',
                  desc: 'mot de pass est obligatoire',
                  btnOkOnPress: () {},
                ).show();
              } else {
                controller.login(email, pass);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text("Login"))
      ],
    );
  }
}
