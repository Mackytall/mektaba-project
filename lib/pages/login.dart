import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test/widget/app_bar_builder.dart';
import 'package:test/widget/textField.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController userName;
  late TextEditingController password;
  bool rememberMe = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userName = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(),
      body:
          SingleChildScrollView(child:
          Center(
              child: Container(
        // padding: EdgeInsets.only(bottom: 8),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Image.asset('assets/pictures/login_image.jpg'),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: SetTextField(
                        controller: userName,
                        hintText: "Identifiant",
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: SetTextField(
                        controller: password,
                        hintText: "Mot de passe",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      // color: Colors.blue,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Row(
                        children: [
                          Checkbox(
                              value: rememberMe,
                              onChanged: (bool? value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                              }),
                          Text("Se rappeler de moi")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Se connecter",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        child: TextButton(
                        onPressed: () => {},
                        child: Text('Mot de passe oublié ?',
                        style: TextStyle(
                          color: Colors.grey,
                        ),),
                      ),),
                  ],
                )),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Pas encore membre ?"),
                      TextButton(
                        onPressed: () => {},
                        child: Text('Créer un compte'),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      )),
      )
    );
  }
}
