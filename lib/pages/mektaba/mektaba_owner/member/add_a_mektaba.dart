import 'package:flutter/material.dart';
import 'package:test/models/user.dart';
import 'package:test/services/ApiService.dart';
import 'package:test/widget/app_bar_builder.dart';
import '../../../../utils/validations.dart';

class AddMektaba extends StatefulWidget {
  const AddMektaba({super.key});

  @override
  State<AddMektaba> createState() => _AddMektabaState();
}

class _AddMektabaState extends State<AddMektaba>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<User> usersList = [];
  String? mektabaOwnerId;
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    getUsersList();
  }

  getUsersList() async {
    try {
      List<User> users = await getUsers();
      usersList = users;
    } catch (e) {
      print(
          "Une erreur s'est produite lors de la récupération des utilisateurs : $e");
    }
  }

  static String _displayStringForOption(User option) =>
      "${option.lastName} ${option.firstName}";
  User? selectedUser;

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _zipCode = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _city = TextEditingController();
  bool checkbool = true;
  bool status = false;
  bool autorisations = true;
  String SwitchExpression = "Activé";
  var newMektaba = new Map<String, dynamic>();
  void clearText() {
    _name.clear();
    _address.clear();
    _zipCode.clear();
    _country.clear();
    _city.clear();
  }

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
          // Navigator.pop(context);

          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            try {
              ApiService().sendData(ApiService().mektabas, newMektaba);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(seconds: 2),
                backgroundColor: Colors.green[800],
                content: Text("La mektaba a été créé avec succès."),
              ));
              clearText();
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(seconds: 2),
                backgroundColor: Colors.red[800],
                content: Text("Erreur lors de la création de la mektaba"),
              ));
            }
          }
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
                          key: _formKey,
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
                                      controller: _name,
                                      decoration: const InputDecoration(
                                        hintText: "Mosquée Nour",
                                      ),
                                      style: TextStyle(fontSize: 20.0),
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "Veuillez renseigner un nom";
                                        } else if (!isValidName(val)) {
                                          return "Le nom n'est pas correct";
                                        }
                                      },
                                      onSaved: (String? val) {
                                        if (val != null) {
                                          newMektaba["name"] = "$val";
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              //PARTIE DU SWITCH DU status
                              Row(
                                children: [
                                  Text(
                                    'status',
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Switch(
                                    activeTrackColor: Colors.lightGreen,
                                    value: status,
                                    onChanged: (value) {
                                      setState(() {
                                        status = value;
                                        if (value == false) {
                                          SwitchExpression = "Désactivé";
                                        } else {
                                          SwitchExpression = "Activé";
                                        }
                                        newMektaba["isEnabled"] = value;
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
                                controller: _address,
                                decoration:
                                    const InputDecoration(hintText: "Adresse"),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez renseigner une addresse";
                                  } else if (val.length < 5) {
                                    return "L'adresse doit contenir au minimum 5 caractères";
                                  }
                                },
                                onSaved: (String? val) {
                                  if (val != null) {
                                    newMektaba["address"] = "$val";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                controller: _zipCode,
                                decoration: const InputDecoration(
                                    hintText: "Code Postale"),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez renseigner un code postal";
                                  } else if (!isValidZipCode(val)) {
                                    return "Le code postal n'est pas correct";
                                  }
                                },
                                onSaved: (String? val) {
                                  if (val != null) {
                                    newMektaba["zipCode"] = "$val";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                controller: _city,
                                decoration:
                                    const InputDecoration(hintText: "Ville"),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez renseigner une ville";
                                  } else if (!isValidName(val)) {
                                    return "Le nom de la ville n'est pas correct";
                                  }
                                },
                                onSaved: (String? val) {
                                  if (val != null) {
                                    newMektaba["city"] = "$val";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                controller: _country,
                                decoration:
                                    const InputDecoration(hintText: "Pays"),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez renseigner un Pays";
                                  } else if (!isValidName(val)) {
                                    return "Le nom du Pays n'est pas correct";
                                  }
                                },
                                onSaved: (String? val) {
                                  if (val != null) {
                                    newMektaba["country"] = "$val";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              // TextFormField(
                              //   decoration: const InputDecoration(
                              //       hintText:
                              //           "Type d'asso(Mosquée,Librairie,etc...)"),
                              // ),
                              SizedBox(
                                height: 10.0,
                              ),
                              //Partie avec le Check des Gestions externes
                              // Row(
                              //   children: [
                              //     Checkbox(
                              //       value: checkbool,
                              //       onChanged: (value) {
                              //         setState(() {
                              //           checkbool = value!;
                              //         });
                              //       },
                              //     ),
                              //     Text('Gestion externe des numéros de livre'),
                              //   ],
                              // ),
                              //SUITE DU FORMULAIRE AVEC LES INFORMATIONS DU RESPONSABLES
                              // FutureBuilder(
                              //     future: futureUsers,
                              //     builder: (context, snapshot) {
                              //       if (snapshot.hasData) {
                              //         users = snapshot.data;
                              //         return Text(users[0].lastName);
                              //       }
                              //       return const CircularProgressIndicator();
                              //     }),

                              RawAutocomplete<User>(
                                optionsBuilder:
                                    (TextEditingValue textEditingValue) {
                                  final filteredUsers =
                                      usersList.where((User option) {
                                    return option.lastName
                                            .toString()
                                            .toLowerCase()
                                            .contains(textEditingValue.text
                                                .toLowerCase()) ||
                                        option.firstName
                                            .toString()
                                            .toLowerCase()
                                            .contains(textEditingValue.text
                                                .toLowerCase());
                                  });
                                  return filteredUsers;
                                },
                                displayStringForOption: _displayStringForOption,
                                fieldViewBuilder: (
                                  BuildContext context,
                                  TextEditingController textEditingController,
                                  FocusNode focusNode,
                                  VoidCallback onFieldSubmitted,
                                ) {
                                  return TextFormField(
                                    controller: textEditingController,
                                    decoration: const InputDecoration(
                                        hintText: "Nom responsable"),
                                    onSaved: (String? val) {
                                      if (selectedUser != null) {
                                        print(selectedUser?.id);
                                        print(selectedUser?.lastName);
                                        newMektaba["owner"] = selectedUser?.id;
                                      }
                                    },
                                    focusNode: focusNode,
                                    onFieldSubmitted: (String value) {
                                      onFieldSubmitted();
                                    },
                                    validator: (String? val) {
                                      List<String>? firstNameSplit =
                                          selectedUser?.firstName.split(" ");
                                      List<String> textSplit =
                                          textEditingController.text.split(" ");
                                      if (val == null || val.isEmpty) {
                                        return "Veuillez renseigner un responsable";
                                      } else if (firstNameSplit != null &&
                                          textSplit.isNotEmpty) {
                                        if ((selectedUser?.lastName
                                                        .split(" ")[0] ==
                                                    textSplit[0] &&
                                                firstNameSplit[
                                                        firstNameSplit.length -
                                                            1] ==
                                                    textSplit[textSplit.length -
                                                        1]) ==
                                            false) {
                                          return "Utilisateur introuvable";
                                        }
                                      } else if (selectedUser == null ||
                                          !usersList.contains(selectedUser)) {
                                        return "Utilisateur introuvable";
                                      }
                                      return null;
                                    },
                                  );
                                },
                                optionsViewBuilder: (BuildContext context,
                                    AutocompleteOnSelected<User> onSelected,
                                    Iterable<User> options) {
                                  return Align(
                                    alignment: Alignment.topLeft,
                                    child: Material(
                                      elevation: 4.0,
                                      child: SizedBox(
                                        height: 200.0,
                                        child: ListView.builder(
                                          padding: const EdgeInsets.all(8.0),
                                          itemCount: options.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final User option =
                                                options.elementAt(index);
                                            return GestureDetector(
                                              onTap: () {
                                                selectedUser = option;
                                                onSelected(option);
                                              },
                                              child: ListTile(
                                                  title: Text(
                                                      _displayStringForOption(
                                                          option))),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),

                              SizedBox(
                                height: 10.0,
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
