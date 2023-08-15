import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/utils/utils.dart';
import 'package:test/widget/app_bar_builder.dart';
import 'package:test/widget/mektaba_icon.dart';
import 'package:test/widget/navigate_to_social_media.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MektabaDetail extends StatelessWidget {
  var _screenSize;

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarBuilder(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              const SizedBox(height: 20),
// First block
              Stack(
                children: <Widget>[
                  Container(
                    height: _screenSize.height / 4,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/pictures/mektaba_tawhid.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                      border: null,
                    ),
                  ),
                  Container(
                    height: _screenSize.height / 3.95,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                          Colors.grey.withOpacity(0.0),
                          Colors.white,
                        ],
                            stops: [
                          0.0,
                          1.0
                        ])),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    // color: Colors.red,
                    height: _screenSize.height / 4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 16),
                            child: Image.asset(
                              "assets/pictures/logo_tawhid.png",
                              height: _screenSize.height / 10,
                            )),
                        Container(
                          height: _screenSize.height / 9.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Centre Tawhid",
                                style: TextStyle(
                                  fontFamily: 'Berlin',
                                  fontSize: 25,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  Text("8 Rue Notre Dame, 69006 Lyon",
                                      style: TextStyle(fontSize: 12),
                                      textAlign: TextAlign.left),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 10),

// Icon row
              Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MektabaIcon(
                        icon: Icons.phone,
                        description: "Téléphone",
                        onTap: () async {
                          final Uri url =
                              Uri(scheme: 'tel', path: '04 72 74 18 69');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            print("l'action n'a pas pu s'éxécuter");
                          }
                        },
                      ),
                      MektabaIcon(
                        icon: Icons.mail,
                        description: "Courriel",
                        onTap: () async {
                          final Uri url = Uri(
                              scheme: 'mailto',
                              path: 'contact@librairie-tawhid.com');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            print("l'action n'a pas pu s'éxécuter");
                          }
                        },
                      ),
                      MektabaIcon(
                        icon: Icons.location_on,
                        description: "Itinéraire",
                        onTap: () => openMapsSheet(context,
                            "8 rue Notre Dame, 69006 Lyon", "Centre Tawhid"),
                      ),
                      MektabaIcon(
                        icon: Icons.language,
                        description: "Site web",
                        onTap: () async {
                          final uri =
                              Uri.parse("https://librairie-tawhid.com/");
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri,
                                mode: LaunchMode.externalApplication);
                          } else {
                            print("l'action n'a pas pu s'éxécuter");
                          }
                        },
                      ),
                      MektabaIcon(
                        icon: Icons.facebook_rounded,
                        description: "Social",
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  padding: EdgeInsets.all(32),
                                  height: _screenSize.height / 6.5,
                                  child: Center(
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: 
                                          NavigateToSocialMadia(navigateToInstagram: true, navigateToFacebook: true, navigateToTelegram: false, navigateToWathsapp: true,
                                          instagramUrl: "https://www.instagram.com/librairietawhid/",
                                          facebookUrl: "https://www.facebook.com/Librairie.Lyon.Tawhid",
                                          wathsappUrl: "https://api.whatsapp.com/send/?phone=%2B33612460626&text&type=phone_number&app_absent=0",)
                                          )),
                                );
                              });
                        },
                      ),
                    ],
                  )),

              Container(
                width: _screenSize.width,
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Présentation", style: TextStyle(fontSize: 16)),
                    Divider(),
                    Text(
                        "En 1990, l’UJM fonde le centre islamique Tawhid, un centre situé au 8 rue Notre Dame au cœur du 6° arrondissement lyonnais. Le nom Tawhid  est choisi pour rappeler la centralité du lien exclusif de transcendance avec Dieu, cœur même du message de l’Islam."),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Informations diverses",
                        style: TextStyle(fontSize: 16)),
                    Divider(),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 64),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(0xFF4B9A6F),
                            ),
                            Icon(
                              Icons.accessible,
                              color: Color(0xFF4B9A6F),
                            ),
                            Icon(
                              Icons.water_drop,
                              color: Color(0xFF4B9A6F),
                            ),
                            Icon(
                              Icons.mosque,
                              color: Color(0xFF4B9A6F),
                            ),
                            Icon(
                              Icons.edit_note,
                              color: Color(0xFF4B9A6F),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Horaire", style: TextStyle(fontSize: 16)),
                    Divider(),
                    Text("Lundi : 8h00 - 12h00 / 13h30 - 19h00"),
                    Text("Mardi : 8h00 - 12h00 / 13h30 - 19h00"),
                    Text("Mercredi : 8h00 - 12h00 / 13h30 - 19h00"),
                    Text("Jeudi : 8h00 - 12h00 / 13h30 - 19h00"),
                    Text("Vendredi : 8h00 - 12h00 / 13h30 - 19h00"),
                    Text("Samedi : 8h00 - 12h00 / 13h30 - 19h00"),
                    Text("Dimanche : 8h00 - 12h00 / 13h30 - 19h00"),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
