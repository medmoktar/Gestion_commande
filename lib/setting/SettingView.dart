import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settingview extends StatelessWidget {
  const Settingview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: MaterialButton(
              onPressed: () {
                Get.toNamed("/AuthenticationView");
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.amberAccent,
              textColor: Colors.black,
              child: Text("Connecter"),
            ),
          )
        ],
      ),
    );
  }
}
