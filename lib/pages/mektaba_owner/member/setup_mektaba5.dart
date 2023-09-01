import 'package:flutter/material.dart';
import 'package:test/models/faq.dart';
import 'package:test/widget/app_bar_builder.dart';

class Setup_Mektaba5 extends StatefulWidget {
  const Setup_Mektaba5({super.key});

  @override
  State<Setup_Mektaba5> createState() => _Setup_Mektaba5State();
}

class _Setup_Mektaba5State extends State<Setup_Mektaba5> {
  final List<Faq> _posts = [
    Faq("Comment reserver ?",
        "C'est tres simple installe mektaba crée toi un compte, une fois ton compte validé, tu auras la possibilité de reserver un livre"),
    Faq("Combien de temps un livre reste réservé ?",
        "Une fois votre résérvations effectué, le livre vous est réservé 24H pendant les heures de permanences"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(
        goBackIcon: true,
        actionIcon: true,
        icon: Icons.add,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[800],
        child: Icon(
          Icons.arrow_forward_sharp,
          color: Colors.white,
        ),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleWidget(color: Colors.green, radius: 12.0),
                    CircleWidget(color: Colors.green, radius: 12.0),
                    CircleWidget(color: Colors.green, radius: 12.0),
                    CircleWidget(color: Colors.green, radius: 12.0),
                    CircleWidget(color: Colors.green, radius: 12.0),
                    CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                    CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              //PARTIE TEXT CONFIGuRATION
              Text(
                "Configuration Mektaba-FAQ",
                style: TextStyle(fontFamily: "Berlin", fontSize: 20.0),
              ),
              Text(
                "Foire aux Questions",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 40.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _posts.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.menu,
                          size: 40,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                _posts[index].question,
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Text(
                                _posts[index].response,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircleWidget extends StatelessWidget {
  final double radius;
  final Color color;
  CircleWidget({required this.color, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
