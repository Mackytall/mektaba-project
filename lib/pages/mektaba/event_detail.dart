import 'package:flutter/material.dart';
import 'package:test/widget/app_bar_builder.dart';

class EventDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarBuilder(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              child: Column(
            children: [
              // const SizedBox(
              //   height: 20,
              // ),
              Stack(
                children: [
                  Container(
                    transform: Matrix4.skewY(-0.1),
                    transformAlignment: Alignment.bottomRight,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xFFa1ecca), Color(0xFF2cd3ba)])),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/pictures/event.jpg",
                    ),
                  ),
                  Container(
                    height: _screenSize.height / 2.9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: _screenSize.width / 2,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          // color: Colors.black,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share_rounded),
                            color: Color(0xFF4B9A6F),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          // color: Colors.black,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.phone),
                            color: Color(0xFF4B9A6F),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          // color: Colors.black,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.mail),
                            color: Color(0xFF4B9A6F),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.bottomLeft,
                  // width: _screenSize.width,
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sam 13 OCT, 14:00 - 17:00",
                        style: TextStyle(
                            color: Color(0xFF4B9A6F),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Rencontre avec Sofiane Mezziani",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Café débat",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Color(0xFF4B9A6F),
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              (Icons.location_on),
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "8 Rue Notre Dame, 69008 Lyon",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // color:Colors.blue,
                            margin: EdgeInsets.only(right: 8, bottom: 32),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Color(0xFF4B9A6F),
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              (Icons.credit_card),
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "5€ / personne",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(onPressed: (){}, child: Text("Réserver ma place",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                               style: ElevatedButton.styleFrom(
                                // padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                backgroundColor: Color(0xFF4B9A6F),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
                               ),
                               ),
                            ),
                          ),
                        ],
                      ),
                      Text("Description",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      Text("Venez partager un moment avec l'auteur Sofiane Mezziani autour de son livre")
                    ],
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
