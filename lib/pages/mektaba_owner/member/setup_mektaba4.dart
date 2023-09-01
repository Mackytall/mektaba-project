import 'package:flutter/material.dart';
import 'package:test/pages/mektaba_owner/member/setup_mektaba4.dart';
import 'package:test/pages/mektaba_owner/member/setup_mektaba5.dart';
import 'package:test/widget/app_bar_builder.dart';

class Setup_Mektaba4 extends StatefulWidget {
  const Setup_Mektaba4({super.key});

  @override
  State<Setup_Mektaba4> createState() => _Setup_Mektaba4State();
}

class _Setup_Mektaba4State extends State<Setup_Mektaba4> {
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
                return Setup_Mektaba5();
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
                      CircleWidget(color: Colors.green, radius: 12.0),
                      CircleWidget(color: Colors.green, radius: 12.0),
                      CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                      CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                      CircleWidget(color: Colors.grey.shade400, radius: 12.0),
                    ],
                  ),
                ),
                Text(
                  "Configuration Mektaba-Conditions",
                  style: TextStyle(fontFamily: "Berlin", fontSize: 20.0),
                ),
                Text(
                  "Configurer les conditions de prêt",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        TextandTextFromField(
                          label: "Durée d'un prêt",
                          labelAfterFormField: "Jours",
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextandTextFromField(
                          label: "Nombre de prêt en simultané",
                          labelAfterFormField: "",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextandTextFromField(
                          label: "Prix d'un prêt",
                          labelAfterFormField: "€",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextandTextFromField(
                          label: "Cout du retard",
                          labelAfterFormField: "€/jours",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextandTextFromField(
                          label: "Durée d'une adhésion",
                          labelAfterFormField: "Jours",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextandTextFromField(
                          label: "Durée de conservations du statut réservé",
                          labelAfterFormField: "Jours",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextandTextFromField extends StatelessWidget {
  TextandTextFromField({
    required this.label,
    this.labelAfterFormField,
  });
  final String label;
  String? labelAfterFormField = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: Text(label)),
        SizedBox(
          width: 30.0,
        ),
        SizedBox(
          height: 30,
          width: 50,
          child: TextFormField(
            style: TextStyle(fontSize: 12),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(flex: 1, child: Text(labelAfterFormField!)),
      ],
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
