import 'package:flutter/material.dart';
import 'package:gestion_locateur/usermaison/UsermaisonController.dart';
import 'package:get/get.dart';

class Usermaisonview extends StatelessWidget {
  final List list;
  const Usermaisonview({super.key, required this.list});
  @override
  Widget build(BuildContext context) {
    final id = list[0];
    final Usermaisoncontroller controller = Get.put(Usermaisoncontroller());
    controller.get(id);
    return Scaffold(
      appBar: AppBar(
        title: Text("4".tr),
      ),
      body: GetBuilder<Usermaisoncontroller>(builder: (c) {
        return GridView.builder(
          itemCount: c.maison.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, i) {
            return !c.t
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : InkWell(
                    onTap: () {
                      Map<String, dynamic> info = {
                        "user_id": id,
                        "id": c.maison[i]['id']
                      };
                      Get.toNamed("user/maison/detaille", arguments: info);
                    },
                    child: Card(
                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              image: DecorationImage(
                                image:
                                    NetworkImage("${c.maison[i]['images'][0]}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${c.maison[i]['localisation']}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                              ),
                              Text(
                                "${c.maison[i]["prix"]} MRU",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
          },
        );
      }),
    );
  }
}
