import 'package:flutter/material.dart';
import 'package:test/pages/mektaba_owner/member/setup_mektaba4.dart';
import 'package:test/widget/app_bar_builder.dart';

class Setup_Mektaba2 extends StatefulWidget {
  const Setup_Mektaba2({super.key});

  @override
  State<Setup_Mektaba2> createState() => _Setup_Mektaba2State();
}

class _Setup_Mektaba2State extends State<Setup_Mektaba2> {
  String nom_de_contact = '';
  String numero = '';
  String mail = '';
  String webSite = '';
  String facebook = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(
        goBackIcon: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Setup_Mektaba4();
              },
            ),
          );
        },
        backgroundColor: Colors.green[800],
        child: Icon(
          Icons.arrow_forward_sharp,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //PARTIE DES CERCLES POUR SAVOIR ON EST A QUELLE ETAPE
                Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleWidget(color: Colors.green, radius: 12.0),
                      CircleWidget(color: Colors.green, radius: 12.0),
                      CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                      CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                      CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                      CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                      CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                    ],
                  ),
                ),
                Text(
                  "Configuration Mektaba-Contact",
                  style: TextStyle(fontFamily: "Berlin", fontSize: 20.0),
                ),
                Text(
                  "Renseigner les informations générales pour vous contacter.",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextIconFromField(
                  icon: Icon(Icons.person),
                  onChanged: (value) {
                    setState(() {
                      nom_de_contact = value;
                    });
                  },
                  hintText: "Nom de contact",
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextIconFromField(
                  icon: Icon(Icons.phone),
                  onChanged: (value) {
                    setState(() {
                      numero = value;
                    });
                  },
                  hintText: "Numéro de téléphone",
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextIconFromField(
                  icon: Icon(Icons.mail),
                  onChanged: (value) {
                    setState(() {
                      mail = value;
                    });
                  },
                  hintText: "Adresse mail de contact",
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextIconFromField(
                  icon: Icon(Icons.web_asset),
                  onChanged: (value) {
                    setState(() {
                      webSite = value;
                    });
                  },
                  hintText: "Site internet",
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextIconFromField(
                  icon: Icon(IconData(0xe255, fontFamily: 'MaterialIcons')),
                  onChanged: (value) {
                    setState(() {
                      facebook = value;
                    });
                  },
                  hintText: "Site internet",
                ),
              ],
            ),
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

class TextIconFromField extends StatelessWidget {
  TextIconFromField(
      {required this.onChanged, required this.icon, required this.hintText});
  final Function(String)? onChanged;
  String? hintText = '';
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: TextFormField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
