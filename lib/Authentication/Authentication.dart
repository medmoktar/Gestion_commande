import 'package:flutter/material.dart';
import 'package:gestion_locateur/login/LoginView.dart';
import 'package:gestion_locateur/register/RegisterView.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text(
            "Authentification",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey[800],
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(10)),
                height: 60,
                margin: EdgeInsets.only(bottom: 20),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(10)),
                    indicatorPadding: EdgeInsets.all(5),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white60,
                    dividerColor: Colors.transparent,
                    // s
                    tabs: [
                      Tab(
                        text: "Login",
                      ),
                      Tab(
                        text: "Register",
                      )
                    ]),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(child: Loginview()),
                    SingleChildScrollView(child: Registerview()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
