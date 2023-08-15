import 'package:flutter/material.dart';
import 'package:test/widget/app_bar_builder.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

enum Gender { male, female }

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  Gender? _gender = Gender.male;
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
                        'https://googleflutter.com/sample_image.jpg'),
                    // fit: BoxFit.fill
                  ),
                ),
              ),
              Form(
                  key: _formKey,
                  child: Container(
                    height: _screenSize.height / 1.5,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 150,
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
                                width: 150,
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
                          decoration: const InputDecoration(hintText: "Nom"),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(hintText: "Prénom"),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(hintText: "Email"),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Téléphone"),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Adresse"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: _screenSize.width / 3.5,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Code Postal"),
                              ),
                            ),
                            Container(
                              width: _screenSize.width / 2,
                              child: TextFormField(
                                decoration:
                                    const InputDecoration(hintText: "Ville"),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: const InputDecoration(hintText: "Pays"),
                        ),
                        Expanded(
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(width: 1),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 32),
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
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 32),
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
                              )),
                        ),
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
