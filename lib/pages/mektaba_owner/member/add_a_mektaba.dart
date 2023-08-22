// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test/widget/app_bar_builder.dart';

class AddMektaba extends StatefulWidget {
  const AddMektaba({super.key});

  @override
  State<AddMektaba> createState() => _AddMektabaState();
}

class _AddMektabaState extends State<AddMektaba> {
  bool checkbool = true;
  bool statut = true;
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
          Row(
            children: [
              Expanded(
                child: Card_Black_White(
                  label: "Information générales",
                  backgroundcolor: Colors.black,
                ),
              ),
              Expanded(
                child: Card_Black_White(
                  label: "Autorisations",
                  backgroundcolor: Colors.white,
                ),
              ),
            ],
          ),
          //PARTIE FORMULAIRE
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Form(
              child: Column(
                children: [
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
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Adresse"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Code Postale"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Pays"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Type d'asso(Mosquée,Librairie,etc...)"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
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
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: "Nom responsable"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: "Mail responsable"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: "Numero responsable"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Card_Black_White extends StatelessWidget {
  Card_Black_White({
    required this.label,
    required this.backgroundcolor,
  });
  String label;
  Color backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: double.infinity / 2,
        height: 50.0,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontFamily: "Berlin",
                color: backgroundcolor == Colors.white
                    ? Colors.black
                    : Colors.white,
                fontSize: 17.0),
          ),
        ),
        decoration: BoxDecoration(color: backgroundcolor, border: Border.all()),
      ),
    );
  }
}
