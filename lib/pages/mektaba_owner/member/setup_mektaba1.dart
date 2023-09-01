import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:test/models/mektaba_multi_scroll.dart';
import 'package:test/pages/mektaba_owner/member/setup_mektaba2.dart';
import 'package:test/widget/app_bar_builder.dart';

class Setup_Mektabe extends StatefulWidget {
  const Setup_Mektabe();
  @override
  State<Setup_Mektabe> createState() => _Setup_MektabeState();
}

class _Setup_MektabeState extends State<Setup_Mektabe> {
  File? _selectedImage;
  File? logoMektaba;
  File? photo_de_profil;
  File? responsable_picture;
  // Future<void> _pickImage(ImageSource source) async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: source);

  //   if (pickedImage != null) {
  //     setState(() {
  //       _selectedImage = File(pickedImage.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBuilder(
          goBackIcon: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Setup_Mektaba2();
                },
              ),
            );
          },
          backgroundColor: Colors.green[800],
          child: Icon(
            Icons.arrow_forward_sharp,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //PARTIE DES CERCLES POUR SAVOIR ON EST A QUELLE ETAPE
                  Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleWidget(color: Colors.green, radius: 12.0),
                        CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                        CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                        CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                        CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                        CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                        CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  //PARTIE TEXT CONFIGuRATION
                  Text(
                    "Configuration Mektaba",
                    style: TextStyle(fontFamily: "Berlin", fontSize: 20.0),
                  ),
                  Text(
                    "Renseigner les informations générales, les horaires, les contacts.",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() async {
                            final picker = ImagePicker();
                            final pickedImage = await picker.pickImage(
                                source: ImageSource.gallery);

                            if (pickedImage != null) {
                              setState(() {
                                _selectedImage = File(pickedImage.path);
                              });
                            }
                          });
                        },
                        child: Container(
                          child: _selectedImage == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "LOGO",
                                      style: TextStyle(
                                          fontSize: 7.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "50x50",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              : CircleAvatar(
                                  radius: 25,
                                  backgroundImage: FileImage(_selectedImage!),
                                ),
                          width: 25 * 2,
                          height: 25 * 2,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "MOSQUEE NOUR",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "000001",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  //Photo de profil
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() async {
                            final picker = ImagePicker();
                            final pickedImage = await picker.pickImage(
                                source: ImageSource.gallery);

                            if (pickedImage != null) {
                              setState(() {
                                photo_de_profil = File(pickedImage.path);
                              });
                            }
                          });
                        },
                        child: Container(
                          child: photo_de_profil == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_a_photo,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Photo de profil",
                                      style: TextStyle(
                                          fontSize: 7.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "50x50",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              : Container(
                                  width: 70,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                          image: FileImage(photo_de_profil!),
                                          fit: BoxFit.cover)),
                                ),
                          width: 70,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.grey.shade300,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Adresse: 15 Rue des Fontaines,",
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Code Postale: 74100 Annemasse,France",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  //PARTIE RESPONSABLE
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() async {
                            final picker = ImagePicker();
                            final pickedImage = await picker.pickImage(
                                source: ImageSource.gallery);

                            if (pickedImage != null) {
                              setState(() {
                                responsable_picture = File(pickedImage.path);
                              });
                            }
                          });
                        },
                        child: Container(
                          child: responsable_picture == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "LOGO",
                                      style: TextStyle(
                                          fontSize: 7.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "50x50",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              : CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      FileImage(responsable_picture!),
                                ),
                          width: 25 * 2,
                          height: 25 * 2,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Responsable :Abderazak Blabla",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Tél: 06.06.06.06.06",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  //PARTIE INFO DIVERSE
                  Text("Informations diverses"),
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(Icons.local_parking_sharp),
                          Text(
                            "Parking",
                            style: TextStyle(fontSize: 7.0),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        children: [
                          Icon(Icons.wheelchair_pickup_sharp),
                          Text(
                            "Accessible",
                            style: TextStyle(fontSize: 7.0),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //PRESENTATION DE LA MEKTABA
                  Text("Presentation"),
                  TextFormField(
                    style: TextStyle(fontSize: 14.0),
                    maxLines: 20,
                    decoration: InputDecoration(
                      hintText:
                          "Saisir une présentation brève de la mektaba (300 mots)",
                      hintStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

//TODO: LE METTRE DANS UN FICHIER A PART
class CircleWidget extends StatelessWidget {
  final double radius;
  final Color color;
  CircleWidget({required this.color, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
