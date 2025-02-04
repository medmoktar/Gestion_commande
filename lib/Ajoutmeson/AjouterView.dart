import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gestion_locateur/Ajoutmeson/AjoutController.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Ajouterview extends StatelessWidget {
  final int id;
  Ajouterview({super.key, required this.id});

  TextEditingController localisation = TextEditingController();
  TextEditingController prix = TextEditingController();
  TextEditingController description = TextEditingController();
  final Ajoutcontroller controller = Get.put(Ajoutcontroller());

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> controler =
        Completer<GoogleMapController>();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.determinePosition(context, controler);
          },
          child: Icon(Icons.my_location),
        ),
        appBar: AppBar(
          title: Text("6".tr, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              input("7".tr, localisation),
              SizedBox(height: 10),
              input("8".tr, prix),
              SizedBox(height: 10),
              input("9".tr, description),
              SizedBox(
                height: 10,
              ),
              GetBuilder<Ajoutcontroller>(
                builder: (c) {
                  return Container(
                    height: 400,
                    child: GoogleMap(
                      initialCameraPosition:
                          CameraPosition(target: LatLng(18.098564, -15.958748)),
                      markers: {
                        Marker(
                            markerId: MarkerId("1"),
                            icon: BitmapDescriptor.defaultMarker,
                            position: LatLng(c.laltitude, c.longitude))
                      },
                      onMapCreated: (GoogleMapController _controller) {
                        if (!controler.isCompleted) {
                          controler.complete(_controller);
                        }
                      },
                      onTap: (position) {
                        if (controler.isCompleted) {
                          c.new_position(position, controler);
                        }
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () => controller.pickImages(),
                  child: Column(
                    children: [
                      Text("10".tr),
                      Icon(
                        Icons.download,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              GetBuilder<Ajoutcontroller>(builder: (c) {
                return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(c.images.length, (i) {
                      return Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.file(
                            c.images[i],
                            fit: BoxFit.cover,
                            height: 100,
                            width: 110,
                          ),
                          InkWell(
                            onTap: () {
                              c.remove(i);
                            },
                            child: Container(
                              color: Colors.red,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      );
                    }));
              }),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (localisation.text.isEmpty ||
                        prix.text.isEmpty ||
                        description.text.isEmpty ||
                        controller.images.isEmpty) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: '12'.tr,
                        desc: '13'.tr,
                        btnOkOnPress: () {},
                      ).show();
                    } else {
                      controller.sendData(
                          context, id, localisation, prix, description);
                      localisation.text = "";
                      prix.text = "";
                      description.text = "";
                      controller.images = [];
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text("11".tr))
            ],
          ),
        ));
  }
}

Widget input(String hint, TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
    ),
  );
}
