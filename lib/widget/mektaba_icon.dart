import 'package:flutter/material.dart';

class MektabaIcon extends StatelessWidget {
  final IconData icon;
  final String description;
  final void Function()? onTap;

  MektabaIcon({
    required this.icon,
    required this.description,
    this.onTap  
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: 
    Column(
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
    ));
  }
}
