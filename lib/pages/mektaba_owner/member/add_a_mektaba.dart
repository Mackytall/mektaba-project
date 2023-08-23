// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test/widget/app_bar_builder.dart';

class AddMektaba extends StatefulWidget {
  const AddMektaba({super.key});

  @override
  State<AddMektaba> createState() => _AddMektabaState();
}

class _AddMektabaState extends State<AddMektaba>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  bool checkbool = true;
  bool statut = true;
  bool autorisations = true;
  String SwitchExpression = "Activé";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarBuilder(
        goBackIcon: true,
        actionIcon: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.green[800],
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          //PARTIE BLACK WHITE
          Column(
            children: [
              TabBar(
                  indicatorColor: Colors.black,
                  dividerColor: Colors.black,
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      child: Card_Black_White(
                        label: "Informations générales",
                      ),
                    ),
                    Tab(child: Card_Black_White(label: "Autorisations"))
                  ]),
              Container(
                height: MediaQuery.of(context).size.height / 1.25,
                // padding: const EdgeInsets.all(8),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    //FORMULAIRE
                    // 2) TODO: RECOLTER LES INFORMATIONS DU QUESTIONNAIRES POUR LA PAGE SUIVANTE(INDICATION AWAIT ASYNC)
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Form(
                          child: Column(
                            children: [
                              //PHOTO DE L'INSTITUT + NOM DE L'INSTITUT
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: "Mosquée Nour",
                                      ),
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              //PARTIE DU SWITCH DU STATUT
                              Row(
                                children: [
                                  Text(
                                    'Statut',
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Switch(
                                    activeTrackColor: Colors.lightGreen,
                                    value: statut,
                                    onChanged: (value) {
                                      setState(() {
                                        statut = value;
                                        if (value == false) {
                                          SwitchExpression = "Désactivé";
                                        } else {
                                          SwitchExpression = "Activé";
                                        }
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(SwitchExpression,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 17.0,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              //RESTE DU FORMULAIRE AVEC LES INFORMATION IMPORTANTE DE L'ENSEIGNE
                              TextFormField(
                                decoration:
                                    const InputDecoration(hintText: "Adresse"),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Code Postale"),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                decoration:
                                    const InputDecoration(hintText: "Pays"),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    hintText:
                                        "Type d'asso(Mosquée,Librairie,etc...)"),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              //Partie avec le Check des Gestions externes
                              Row(
                                children: [
                                  Checkbox(
                                    value: checkbool,
                                    onChanged: (value) {
                                      setState(() {
                                        checkbool = value!;
                                      });
                                    },
                                  ),
                                  Text('Gestion externe des numéros de livre'),
                                ],
                              ),
                              //SUITE DU FORMULAIRE AVEC LES INFORMATIONS DU RESPONSABLES
                              TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Nom responsable"),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Mail responsable"),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Numero responsable"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Autorisation
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          children: [
                            //image
                            // 1)TODO: CHANGER LES INFORMATIONS POUR PRENDRE CEUX DE LA BASE DE DONNEES
                            Image.asset(
                              'assets/pictures/logo_tawhid.png',
                              height: 50.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            //Partie Texte
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amir BENZIANE',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Responsable d\' un chat',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Card_Black_White extends StatelessWidget {
  Card_Black_White({
    required this.label,
  });
  String label;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontFamily: "Berlin", fontSize: 17.0),
        ),
      ),
      //decoration: BoxDecoration(border: Border.all()),
    );
  }
}
