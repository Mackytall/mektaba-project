import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/book.dart';


class SetTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final void Function(String?)? onSaved;


  SetTextField(
      {required this.controller, this.labelText, this.hintText, this.maxLines, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              border: const OutlineInputBorder(),
            ),
            maxLines: maxLines,
            style: const TextStyle(
              fontSize: 12,
            ),
            validator: ( (value) {
              if (value == null || value.isEmpty) {
                return "Veuillez renseigner tout les champs";
              }
            }),
            onSaved: onSaved,
            ));
  }
}