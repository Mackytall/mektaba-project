import 'package:flutter/material.dart';
import 'package:test/widget/app_bar_builder.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(),
      body: SingleChildScrollView(
        child: Center(child: Container(child: Column(children: [
          const SizedBox(height:20)
        ],),)),
      ),
    );
  }
}