import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'mektaba/mektaba_main_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late Future<void> animatedTextFuture;
  bool _visible = false;
  @override
  void initState() {
    super.initState();
    _waitForFadeInText();
    animatedTextFuture = waitForAnimatedText();
    _navigateToHome();
  }

  Future<void> waitForAnimatedText() async {
    await Future.delayed(Duration(milliseconds: 1000));
  }

  _waitForFadeInText() async {
    await Future.delayed(Duration(milliseconds: 500), () {});
    setState(() {
      _visible = !_visible;
    });
    ;
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Color(0xFF007134),
              width: 1.0,
            ))),
            child: const Text(
              "mektaba",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Berlin',
              ),
            ),
          ),
        ),
         Container(
            height: MediaQuery.of(context).size.height / 6,
            child: FutureBuilder<void>(
              future: animatedTextFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          alignment: Alignment.topRight,
                          child: AnimatedTextKit(
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                textAlign: TextAlign.end,
                                'Bibliothèques musulmanes \n pour tous et partout..',
                                speed: const Duration(milliseconds: 60),
                                cursor: '.',
                              ),
                            ],
                          ))
                    ],
                  );
                } else {
                  return const Text("");
                }
              },
            )),
      ],
    ))));
  }
}
