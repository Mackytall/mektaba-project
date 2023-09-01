import 'package:flutter/material.dart';
import 'package:test/services/ApiService.dart';
import 'package:test/utils/validations.dart';
import 'package:test/widget/app_bar_builder.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

enum Gender { male, female }

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _zipCode = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final String passwordConditions =
      "Au moins 8 caractères\nAu moins une minuscule\nAu moins une majuscule\nAu moins un chiffre\nAu moins un caractère spécial (! @ # \$ & * ~ .)";
  var newUser = new Map<String, dynamic>();

  Gender? _gender = Gender.male;
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
              child: const Text(
                "Annuler",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  try {
                    // to do enter in the catch when the ressource is not created, : if the call response == false display error message, do the same in mektaba add page
                    ApiService()
                        .sendData(ApiService().createUserEndpoint, newUser);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green[800],
                      content: Text("Inscription accompli avec succès."),
                    ));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.red[800],
                      content: Text("Erreur lors de l'inscription"),
                    ));
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                "S'inscrire",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBarBuilder(),
      body: SingleChildScrollView(
        child: Center(
            child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_1280.png'),
                      fit: BoxFit.fill),
                ),
              ),
              Form(
                  key: _formKey,
                  child: Container(
                    // height: _screenSize.height / 1.5,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 140,
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                   title: const Text("Homme"),
                                  leading: Radio<Gender>(
                                    value: Gender.male,
                                    groupValue: _gender,
                                    onChanged: (Gender? value) {
                                      setState(() {
                                        _gender = value;
                                      });
                                    },
                                  ),
                                )),
                            Container(
                                height: 50,
                                width: 140,
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: const Text("Femme"),
                                  leading: Radio<Gender>(
                                    value: Gender.female,
                                    groupValue: _gender,
                                    onChanged: (Gender? value) {
                                      setState(() {
                                        _gender = value;
                                      });
                                    },
                                  ),
                                )),
                          ],
                        ),

                        TextFormField(
                          controller: _lastName,
                          decoration: const InputDecoration(hintText: "Nom"),
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
                              newUser["lastName"] = "$val";
                            }
                          },
                        ),
                        TextFormField(
                          controller: _firstName,
                          decoration: const InputDecoration(hintText: "Prénom"),
                          style: TextStyle(fontSize: 20.0),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Veuillez renseigner un prénom";
                            } else if (!isValidName(val)) {
                              return "Le prénom n'est pas correct";
                            }
                          },
                          onSaved: (String? val) {
                            if (val != null) {
                              newUser["firstName"] = "$val";
                            }
                          },
                        ),
                        TextFormField(
                          controller: _email,
                          decoration: const InputDecoration(hintText: "Email"),
                          style: TextStyle(fontSize: 20.0),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Veuillez renseigner un email";
                            } else if (!isValidEmail(val)) {
                              return "L'email n'est pas correct";
                            }
                          },
                          onSaved: (String? val) {
                            if (val != null) {
                              newUser["email"] = "$val";
                            }
                          },
                        ),
                        TextFormField(
                          controller: _phone,
                          decoration:
                              const InputDecoration(hintText: "Téléphone"),
                          style: TextStyle(fontSize: 20.0),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Veuillez renseigner un numéro de téléphone";
                            } else if (!isValidPhone(val)) {
                              return "Le numéro de téléphone n'est pas correct";
                            }
                          },
                          onSaved: (String? val) {
                            if (val != null) {
                              newUser["phone"] = "$val";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: _address,
                          decoration:
                              const InputDecoration(hintText: "Adresse"),
                          style: TextStyle(fontSize: 20.0),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Veuillez renseigner une addresse";
                            } else if (!isValidAddress(val)) {
                              return "L'addresse' n'est pas correct";
                            }
                          },
                          onSaved: (String? val) {
                            if (val != null) {
                              newUser["address"] = "$val";
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: _screenSize.width / 3.5,
                              child: TextFormField(
                                controller: _zipCode,
                                decoration: const InputDecoration(
                                    hintText: "Code Postal"),
                                style: TextStyle(fontSize: 20.0),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez renseigner un code postal";
                                  } else if (!isValidZipCode(val)) {
                                    return "Le code postal n'est pas correct";
                                  }
                                },
                                onSaved: (String? val) {
                                  if (val != null) {
                                    newUser["zipCode"] = "$val";
                                  }
                                },
                              ),
                            ),
                            Container(
                              width: _screenSize.width / 2,
                              child: TextFormField(
                                controller: _city,
                                decoration:
                                    const InputDecoration(hintText: "Ville"),
                                style: TextStyle(fontSize: 20.0),
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez renseigner une ville";
                                  } else if (!isValidName(val)) {
                                    return "La ville n'est pas correct";
                                  }
                                },
                                onSaved: (String? val) {
                                  if (val != null) {
                                    newUser["city"] = "$val";
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _country,
                          decoration: const InputDecoration(hintText: "Pays"),
                          style: TextStyle(fontSize: 20.0),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Veuillez renseigner un Pays";
                            } else if (!isValidName(val)) {
                              return "La Pays n'est pas correct";
                            }
                          },
                          onSaved: (String? val) {
                            if (val != null) {
                              newUser["country"] = "$val";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _password,
                          decoration: InputDecoration(
                              hintText: "Choisissez un mot de passe"),
                          style: TextStyle(fontSize: 20.0),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Veuillez renseigner un mot de passe";
                            } else if (!isValidPassword(val)) {
                              return passwordConditions;
                            }
                          },
                          onSaved: (String? val) {
                            if (val != null) {
                              newUser["password"] = "$val";
                            }
                          },
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          maxLength: 50,
                        ),
                        TextFormField(
                          controller: _confirmPassword,
                          decoration: const InputDecoration(
                              hintText: "Confirmez le mot de passe"),
                          style: TextStyle(fontSize: 20.0),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Veuillez confirmer le mot de passe";
                            } else if (!isValidConfirmPassword(
                                _password.text, val)) {
                              return "Les mots de passe ne correspondent pas";
                            }
                          },
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          maxLength: 50,
                        ),

                        // Expanded(
                        // child:
                        // Container(
                        //   height: 50,
                        //   color: Colors.blue,
                        // ),
                        // Align(
                        //     alignment: Alignment.bottomCenter,
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //       children: [
                        //         ElevatedButton(
                        //           onPressed: () {
                        //             Navigator.pop(context);
                        //           },
                        //           style: ElevatedButton.styleFrom(
                        //             shape: RoundedRectangleBorder(
                        //                 side: BorderSide(width: 1),
                        //                 borderRadius: BorderRadius.circular(8)),
                        //             padding: EdgeInsets.symmetric(
                        //                 vertical: 8, horizontal: 32),
                        //             foregroundColor: Colors.black,
                        //             backgroundColor: Colors.white,
                        //           ),
                        //           child: const Text(
                        //             "Annuler",
                        //             style: TextStyle(
                        //               fontSize: 18,
                        //             ),
                        //           ),
                        //         ),
                        //         ElevatedButton(
                        //           onPressed: () {},
                        //           style: ElevatedButton.styleFrom(
                        //             shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(8)),
                        //             padding: EdgeInsets.symmetric(
                        //                 vertical: 8, horizontal: 32),
                        //             backgroundColor: Colors.black,
                        //             foregroundColor: Colors.white,
                        //           ),
                        //           child: const Text(
                        //             "S'inscrire",
                        //             style: TextStyle(
                        //               fontSize: 18,
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     )),
                        // ),
                      ],
                    ),
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
