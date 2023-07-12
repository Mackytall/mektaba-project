import 'package:flutter/material.dart';

class MektabaIcon extends StatelessWidget {
  final IconData icon;
  final String description;

  MektabaIcon({
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(50)),
          // color: Colors.black,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        Text(
          description,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        )
      ],
    );
  }
}
