import 'package:flutter/material.dart';
import 'package:test/widget/app_bar_builder.dart';

class MemberValidation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MemberValidationState();
}

enum Gender { male, female }

class _MemberValidationState extends State<MemberValidation> {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarBuilder(),
      body:  Center(
            child:  
             Container(
              
          padding: EdgeInsets.all(16),
          child: Column(children: [
            Container(
              height: _screenSize.height/1.3,
              child: 
            
            SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_1280.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Monsieur"),
                    Text("Bla Bla"),
                    Text("Abderazzak"),
                  ],
                )
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Icon(Icons.phone),
                const SizedBox(
                  width: 10,
                ),
                Text("06.06.06.06.06")
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.mail),
                const SizedBox(
                  width: 10,
                ),
                Text("adflkbjnr@gmail.com")
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.location_on),
                const SizedBox(
                  width: 10,
                ),
                Text("9 rue de la fortune, \n74100 Annemasse, France")
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: null,
                ),
                const SizedBox(width: 10),
                Text("Pièce d'identité verifié"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: true,
                  activeColor: Colors.black,
                  onChanged: null,
                ),
                const SizedBox(width: 10),
                Text("Règlement intérieur signé"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: null,
                ),
                const SizedBox(width: 10),
                Text("Cotisation payé"),
              ],
            ),
            const SizedBox(height: 20),
            Text("Echéance d'adhésion: 01.01.2021"),
             
         
          ]),
            )),
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
                                      "Valider adhésion",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
         
          ],)
      
              
        ),
      ),
    );
  }
}
