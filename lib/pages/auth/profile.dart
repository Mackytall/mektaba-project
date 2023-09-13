import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:test/models/user.dart';
import 'package:test/providers/providers.dart';
import 'package:test/widget/app_bar_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Profile extends HookConsumerWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dynamic user = ref.watch(authProvider);

    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarBuilder(),
      body: SingleChildScrollView(
        child: Center(
            child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_1280.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: _screenSize.width / 2,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Bonjour",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                          user == null
                              ? Text("Invité",
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600))
                              : Text("${user.firstName}",
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600)),
                          const Text("Dernière connexion : 20.01.2021",
                              style: TextStyle(fontSize: 12)),
                        ]),
                  )
                ],
              ),
              Text(
                "Mes données",
                style: TextStyle(fontSize: 16),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                      child: Container(
                    padding: EdgeInsets.all(16),
                    height: _screenSize.height / 4,
                    width: _screenSize.width / 2.8,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("3",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: 5,
                              ),
                              Text("emprunts",
                                  style: TextStyle(
                                    color: Colors.green,
                                  ))
                            ],
                          ),
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(color: Colors.red),
                                  children: [
                                TextSpan(
                                    text: "1",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: " Retards"),
                              ])),
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(color: Colors.orangeAccent),
                                  children: [
                                TextSpan(
                                    text: "2",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: " Réservés"),
                              ])),
                        ]),
                  )),
                  Container(
                    height: _screenSize.height / 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              child: Container(
                                  padding: EdgeInsets.all(2),
                                  height: _screenSize.height / 9,
                                  width: _screenSize.width / 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(children: [
                                        Text(
                                          "12 ",
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        Icon(
                                          Icons.favorite,
                                          size: 30,
                                        ),
                                      ]),
                                      Text(
                                        "Mes favoris",
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  )),
                            ),
                            Card(
                              child: Container(
                                  padding: EdgeInsets.all(2),
                                  height: _screenSize.height / 9,
                                  width: _screenSize.width / 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.perm_contact_calendar,
                                        size: 26,
                                      ),
                                      Text(
                                        "Mes données \npersonnelles",
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              child: Container(
                                  padding: EdgeInsets.all(2),
                                  height: _screenSize.height / 9,
                                  width: _screenSize.width / 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(children: [
                                        Text(
                                          "12 ",
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        Icon(
                                          Icons.favorite,
                                          size: 30,
                                        ),
                                      ]),
                                      Text(
                                        "Mes favoris",
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  )),
                            ),
                            Card(
                              child: Container(
                                  padding: EdgeInsets.all(2),
                                  height: _screenSize.height / 9,
                                  width: _screenSize.width / 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.perm_contact_calendar,
                                        size: 26,
                                      ),
                                      Text(
                                        "Mes données \npersonnelles",
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Ma mektaba",
                style: TextStyle(fontSize: 16),
              ),
              const Divider(),
              Card(
                child: Container(
                  width: _screenSize.width,
                  padding: EdgeInsets.all(8),
                  child: Row(children: [
                    Image.asset(
                      'assets/pictures/logo_tawhid.png',
                      width: 70,
                      height: 70,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Centre Tawhid",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600)),
                        Text(
                          "8 rue Notre Dame, 69006 Lyon",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Mes apps admin",
                style: TextStyle(fontSize: 16),
              ),
              const Divider(),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(2),
                              height: _screenSize.height / 10,
                              width: _screenSize.width / 5,
                              child: Column(
                                children: [
                                  Text("3",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text("Nouvelles adhésions",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))
                                ],
                              ),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(2),
                              height: _screenSize.height / 10,
                              width: _screenSize.width / 5,
                              child: Column(
                                children: [
                                  Text("15000",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text("Ouvrages disponibles",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))
                                ],
                              ),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(2),
                              height: _screenSize.height / 10,
                              width: _screenSize.width / 5,
                              child: Column(
                                children: [
                                  Text("150",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text("Prêt en cours",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))
                                ],
                              ),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(2),
                              height: _screenSize.height / 10,
                              width: _screenSize.width / 5,
                              child: Column(
                                children: [
                                  Text("12",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text("Réservations",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))
                                ],
                              ),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(2),
                              height: _screenSize.height / 10,
                              width: _screenSize.width / 5,
                              child: Column(
                                children: [
                                  Text("18",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text("Retards",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))
                                ],
                              ),
                            ),
                          )),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Mes apps admin",
                style: TextStyle(fontSize: 16),
              ),
              const Divider(),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Card(
                        child: Container(
                            padding: EdgeInsets.all(2),
                            height: _screenSize.height / 10,
                            width: _screenSize.width / 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_business,
                                  size: 26,
                                ),
                                Text(
                                  "Créer une \nmektaba",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            )),
                      )),
                  Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Card(
                        child: Container(
                            padding: EdgeInsets.all(2),
                            height: _screenSize.height / 10,
                            width: _screenSize.width / 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_business,
                                  size: 26,
                                ),
                                Text(
                                  "Configurer ma \nmektaba",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            )),
                      )),
                  Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Card(
                        child: Container(
                            padding: EdgeInsets.all(2),
                            height: _screenSize.height / 10,
                            width: _screenSize.width / 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_business,
                                  size: 26,
                                ),
                                Text(
                                  "Gérer ma \nmektaba",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            )),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Mes apps admin",
                style: TextStyle(fontSize: 16),
              ),
              const Divider(),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Card(
                        child: Container(
                            padding: EdgeInsets.all(2),
                            height: _screenSize.height / 10,
                            width: _screenSize.width / 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.library_books,
                                  size: 26,
                                ),
                                Text(
                                  "Gestions des \nouvrages",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            )),
                      )),
                  Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Card(
                        child: Container(
                            padding: EdgeInsets.all(2),
                            height: _screenSize.height / 10,
                            width: _screenSize.width / 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.group,
                                  size: 26,
                                ),
                                Text(
                                  "Gestion des \nadhérents",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            )),
                      )),
                  Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Card(
                        child: Container(
                            padding: EdgeInsets.all(2),
                            height: _screenSize.height / 10,
                            width: _screenSize.width / 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.event_available,
                                  size: 26,
                                ),
                                Text(
                                  "Gestion des \névènement",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            )),
                      )),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
