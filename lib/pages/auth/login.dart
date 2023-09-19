import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test/constants/storage.dart';
import 'package:test/models/auth.dart';
import 'package:test/models/user.dart';
import 'package:test/pages/auth/profile.dart';
import 'package:test/pages/auth/sign_up.dart';
import 'package:test/providers/providers.dart';
import 'package:test/utils/user.dart';
import 'package:test/utils/validations.dart';
import 'package:test/widget/app_bar_builder.dart';
import 'package:test/widget/textField.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Login extends HookConsumerWidget {
  Login({
    super.key,
    this.goBackAfterLogin = false,
  });

  final bool goBackAfterLogin;

  final _loginKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = useState<String?>(null);
    final user = ref.watch(authProvider);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (user != null && !goBackAfterLogin) {
    //     // navigate to profile page
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => Profile()),
    //     );
    //   }
    // });

    void redirect() {
      if (goBackAfterLogin) {
        Navigator.of(context).pop();
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
      }
    }

    ;

    void onLogin() async {
      if (_loginKey.currentState!.validate()) {
        LogUser user = LogUser(email: _email.text, password: _password.text);
        final authUser = await login(user);
        if (authUser.user != null && authUser.token != null) {
          setUserInLocalStorage(authUser.user!.id, authUser.token!);
          ref.read(tokenProvider.notifier).setCurrentToken(authUser.token!);
          ref.read(authProvider.notifier).setCurrentUser(authUser.user!);
          error.value = null;
          redirect();
        } else if (authUser.errorMessage != null &&
            authUser.errorMessage!.isNotEmpty) {
          error.value = authUser.errorMessage;
        } else {
          error.value = "Un problème est survenu, veuillez réessayer";
        }
      }
    }

    return Scaffold(
        bottomNavigationBar: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Pas encore membre ?"),
                TextButton(
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()))
                  },
                  child: Text('Créer un compte'),
                ),
              ],
            )),
        appBar: AppBarBuilder(),
        body: SingleChildScrollView(
          child: Center(
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
                    key: _loginKey,
                    child: Column(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: TextFormField(
                              controller: _email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Ce champs est requis";
                                }
                                if (value.isNotEmpty) {
                                  if (!isValidEmail(value)) {
                                    return "L'email n'est pas valide";
                                  }
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              maxLength: 200,
                              autocorrect: false,
                              decoration: InputDecoration(
                                hintText: "Email",
                                border: const OutlineInputBorder(),
                              ),
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextFormField(
                            controller: _password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ce champs est requis";
                              }

                              return null;
                            },
                            obscureText: true,
                            enableSuggestions: false,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Mot de passe",
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        Visibility(
                          visible:
                              error.value != null && error.value!.isNotEmpty,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: const BoxDecoration(
                              color: Color(0xFFFDEDED),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.error),
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
                        Visibility(
                            visible:
                                error.value != null && error.value!.isNotEmpty,
                            child: const SizedBox(
                              height: 20,
                            )),
                        ElevatedButton(
                          onPressed: () {
                            onLogin();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 32),
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
                            child: Text(
                              'Mot de passe oublié ?',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
