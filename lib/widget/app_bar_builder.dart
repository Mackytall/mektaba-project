import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AppBarBuilder extends StatelessWidget implements PreferredSizeWidget {
  final bool goBackIcon;
  final BuildContext? context;
  final bool actionIcon;
  final IconData? icon;
  final String? tooltip;
  final void Function()? onPressed;

  AppBarBuilder(
      {
      this.goBackIcon = false,
      this.context,
      this.actionIcon = false,
      this.icon,
      this.tooltip,
      this.onPressed});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "mektaba",
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Berlin',
        ),
      ),
      //backgroundColor: Colors.red,
      //elevation: 0,
      centerTitle: true,
      leading: goBackIcon
          ? IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.black,
              ),
              tooltip: 'Revenir en arrière',
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
       actions:  [ actionIcon ?
          IconButton(
            icon:  FaIcon(
              icon,
              color: Colors.black,
            ),
            tooltip: tooltip,
            onPressed: onPressed,

            
          )
          : Text("")
        ],
    );
  }
}
