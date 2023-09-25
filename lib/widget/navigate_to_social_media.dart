import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigateToSocialMadia extends StatelessWidget {
  bool navigateToInstagram = false;
  bool navigateToFacebook = false;
  bool navigateToTelegram = false;
  bool navigateToWathsapp = false;
  final String instagramUrl;
  final String facebookUrl;
  final String telegramUrl;
  final String wathsappUrl;

  NavigateToSocialMadia({
    required this.navigateToInstagram,
    required this.navigateToFacebook,
    required this.navigateToTelegram,
    required this.navigateToWathsapp,
    this.instagramUrl = "",
    this.facebookUrl = "",
    this.telegramUrl = "",
    this.wathsappUrl = "",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        navigateToInstagram
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () async {
                    final uri = Uri.parse(instagramUrl);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    } else {
                      print("l'action n'a pas pu s'éxécuter");
                    }
                  },
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Color(0xFFE1306C),
                        size: 35,
                      ),
                      Text("Instagram")
                    ],
                  ),
                ))
            : Text(""),
        navigateToFacebook
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () async {
                    final uri = Uri.parse(facebookUrl);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    } else {
                      print("l'action n'a pas pu s'éxécuter");
                    }
                  },
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Color(0xFF4267B2),
                        size: 35,
                      ),
                      Text("Facebook")
                    ],
                  ),
                ))
            : Text(""),
        navigateToTelegram
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () async {
                    final uri = Uri.parse(telegramUrl);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    } else {
                      print("l'action n'a pas pu s'éxécuter");
                    }
                  },
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.telegram,
                        color: Color(0xFF0088CC),
                        size: 35,
                      ),
                      Text("Telegram")
                    ],
                  ),
                ))
            : Text(""),
        navigateToWathsapp
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () async {
                    final uri = Uri.parse(wathsappUrl);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    } else {
                      print("l'action n'a pas pu s'éxécuter");
                    }
                  },
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Color(0xFF25D366),
                        size: 35,
                      ),
                      Text("Wathsapp")
                    ],
                  ),
                ))
            : Text("")
      ],
    );
  }
}
