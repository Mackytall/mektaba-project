import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test/models/auth.dart';
import 'package:test/models/user.dart';
import 'package:test/providers/providers.dart';
import 'package:test/utils/user.dart';
import 'package:test/utils/utils.dart';
import 'package:test/utils/validations.dart';
import 'package:test/widget/app_bar_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'profile.dart';
import 'package:image_picker/image_picker.dart';

enum Gender { male, female }

class SignUp extends HookConsumerWidget {
  SignUp({super.key});

  showSuccessDialog(
    BuildContext context,
  ) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Align(
            alignment: Alignment.center,
            child: AlertDialog(
                backgroundColor: Color(0xFF4B9A6F),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.white,
                      size: 50,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Félicitations",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Pour que votre inscription soit complète, merci de cliquer sur le lien du mail envoyé.",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      child: Text(
                        "ok",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ))
                ]));
      },
    );
  }

  final __signUpFormKey = GlobalKey<FormState>();
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
  XFile? image;
  // final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = useState<String?>(null);
    Size _screenSize = MediaQuery.of(context).size;
    Gender? _gender = Gender.male;

    void onSignUp() async {
      if (__signUpFormKey.currentState!.validate()) {
        CreateUser user = CreateUser(
            lastName: cleanupWhitespace(_lastName.text),
            firstName: cleanupWhitespace(_firstName.text),
            email: cleanupWhitespace(_email.text),
            phone: cleanupWhitespace(_phone.text),
            address: cleanupWhitespace(_address.text),
            zipCode: cleanupWhitespace(_zipCode.text),
            city: cleanupWhitespace(_city.text),
            country: cleanupWhitespace(_country.text),
            password: cleanupWhitespace(_password.text));

        final authUser = await signUp(user);
        print(authUser);
        if (authUser.user != null && authUser.token != null) {
          try {
            setUserInLocalStorage(authUser.user!.id, authUser.token!);
            ref.read(tokenProvider.notifier).setCurrentToken(authUser.token!);
            ref.read(authProvider.notifier).setCurrentUser(authUser.user!);
          } catch (e) {
            print(e);
          }

          error.value = null;
          showSuccessDialog(context);
        } else if (authUser.errorMessage != null &&
            authUser.errorMessage!.isNotEmpty) {
          error.value = authUser.errorMessage;
        } else {
          error.value = "un problème est survenu, veuillez rééssayer";
        }
      }
    }

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
                onSignUp();
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
                  key: __signUpFormKey,
                  child: Container(
                    // height: _screenSize.height / 1.5,
                    child: Column(
                      children: [
                        // Row(
                        //   children: [
                        //     Container(
                        //         height: 50,
                        //         width: 140,
                        //         child: ListTile(
                        //           contentPadding: EdgeInsets.all(0),
                        //           title: const Text("Homme"),
                        //           leading: Radio<Gender>(
                        //             value: Gender.male,
                        //             groupValue: _gender,
                        //             onChanged: (Gender? value) {
                        //               setState(() {
                        //                 _gender = value;
                        //               });
                        //             },
                        //           ),
                        //         )),
                        //     Container(
                        //         height: 50,
                        //         width: 140,
                        //         child: ListTile(
                        //           contentPadding: EdgeInsets.all(0),
                        //           title: const Text("Femme"),
                        //           leading: Radio<Gender>(
                        //             value: Gender.female,
                        //             groupValue: _gender,
                        //             onChanged: (Gender? value) {
                        //               setState(() {
                        //                 _gender = value;
                        //               });
                        //             },
                        //           ),
                        //         )),
                        //   ],
                        // ),

                        TextFormField(
                          controller: _lastName,
                          decoration: const InputDecoration(hintText: "Nom"),
                          //
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Veuillez renseigner un nom";
                            } else if (!isValidName(val)) {
                              return "Le nom n'est pas correct";
                            }
                          },
                        ),
                        TextFormField(
                          controller: _firstName,
                          decoration: const InputDecoration(hintText: "Prénom"),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Veuillez renseigner un prénom";
                            } else if (!isValidName(val)) {
                              return "Le prénom n'est pas correct";
                            }
                          },
                        ),
                        TextFormField(
                          controller: _email,
                          decoration: const InputDecoration(hintText: "Email"),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Veuillez renseigner un email";
                            } else if (!isValidEmail(val)) {
                              return "L'email n'est pas correct";
                            }
                          },
                        ),
                        TextFormField(
                          controller: _phone,
                          decoration:
                              const InputDecoration(hintText: "Téléphone"),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Veuillez renseigner un numéro de téléphone";
                            } else if (!isValidPhone(val)) {
                              return "Le numéro de téléphone n'est pas correct";
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
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Veuillez renseigner une addresse";
                            } else if (!isValidAddress(val)) {
                              return "L'addresse' n'est pas correct";
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
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez renseigner un code postal";
                                  } else if (!isValidZipCode(val)) {
                                    return "Le code postal n'est pas correct";
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
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Veuillez renseigner une ville";
                                  } else if (!isValidName(val)) {
                                    return "La ville n'est pas correct";
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _country,
                          decoration: const InputDecoration(hintText: "Pays"),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Veuillez renseigner un Pays";
                            } else if (!isValidName(val)) {
                              return "La Pays n'est pas correct";
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
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Veuillez renseigner un mot de passe";
                            } else if (!isValidPassword(val)) {
                              return passwordConditions;
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
                        Visibility(
                          visible:
                              error.value != null && error.value!.isNotEmpty,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            decoration: const BoxDecoration(
                              color: Color(0xFFFDEDED),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.error),
                                const SizedBox(
                                  width: 20,
                                ),
                                Center(
                                  child: Text(
                                    error.value.toString(),
                                    style: const TextStyle(
                                      color: Color(0xFF5F2120),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
