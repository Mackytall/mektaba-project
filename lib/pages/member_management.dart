import 'package:flutter/material.dart';
import 'package:test/widget/app_bar_builder.dart';

class MemberManagement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MemberManagementState();
}

enum Gender { male, female }

class _MemberManagementState extends State<MemberManagement> {
  final _formKey = GlobalKey<FormState>();
  Gender? _gender = Gender.male;
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarBuilder(),
      body: SingleChildScrollView(
        child: Center(
            child: Container(
          padding: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),
            Text("Gestion des Adhérents"),
            Text("Listes des personnes adhérentes"),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  width: 50,
                  height: 50,
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
                    Text("Abderazzak bla-bla"),
                    Text("Adhérent"),
                  ],
                )
              ],
            )
          ]),
        )),
      ),
    );
  }
}
