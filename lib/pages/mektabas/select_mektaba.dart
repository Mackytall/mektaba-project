import 'package:flutter/material.dart';
import 'package:test/widget/app_bar_builder.dart';

class SelectMektaba extends StatefulWidget {
  const SelectMektaba({Key? key}) : super(key: key);

  @override
  State<SelectMektaba> createState() => _SelectMektaba();
}

class _SelectMektaba extends State<SelectMektaba> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sélectionnez une mektaba",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Berlin'),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text("Sélectionnez pour découvrir les ouvrages disponibles",
                    style: TextStyle(fontSize: 14)),
                const SizedBox(
                  height: 20,
                ),
               
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: Image.asset(
                        'assets/pictures/wajiz.jpg',
                        height: 50,
                        width: 50,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mosquee Othmane",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text("51 rue Octavie, 69100 Villeurbanne")
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
