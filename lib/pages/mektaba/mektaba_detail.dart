import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/utils/utils.dart';
import 'package:test/widget/app_bar_builder.dart';
import 'package:test/widget/mektaba_icon.dart';
import 'package:test/widget/navigate_to_social_media.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:test/models/mektaba.dart';

class MektabaDetail extends StatelessWidget {
  var _screenSize;
  MektabaDetail({
    required this.mektaba,
  });
  final Mektaba mektaba;

  void onCall() async {
    final Uri url = Uri(scheme: 'tel', path: mektaba.phone);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("l'action n'a pas pu s'éxécuter");
    }
  }

  void onEmail() async {
    final Uri url = Uri(scheme: 'mailto', path: mektaba.email);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("l'action n'a pas pu s'éxécuter");
    }
  }

  void navigateToWebsite() async {
    final uri = Uri.parse(mektaba.website!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print("l'action n'a pas pu s'éxécuter");
    }
  }

  showSocialMedia(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(32),
            height: _screenSize.height / 6.5,
            child: Center(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: NavigateToSocialMadia(
                      navigateToInstagram:
                          mektaba.instagram != null ? true : false,
                      navigateToFacebook:
                          mektaba.facebook != null ? true : false,
                      // navigateToTelegram: mektaba.telegram != null ? true : false,
                      navigateToTelegram: false,
                      navigateToWathsapp:
                          mektaba.whatsapp != null ? true : false,
                      instagramUrl:
                          mektaba.instagram != null ? mektaba.instagram! : "",
                      facebookUrl:
                          mektaba.facebook != null ? mektaba.facebook! : "",
                      wathsappUrl:
                          mektaba.whatsapp != null ? mektaba.whatsapp! : "",
                    ))),
          );
        });
  }

  showIcon(icon) {
    return Icon(
      icon,
      color: Color(0xFF4B9A6F),
    );
  }

  showIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.location_on,
          color: Color(0xFF4B9A6F),
        ),
        mektaba.accessibleToEveryone ? showIcon(Icons.accessible) : null,
        mektaba.canPerformAblution ? showIcon(Icons.water_drop) : null,
        mektaba.canPray ? showIcon(Icons.mosque) : null,
        mektaba.canTakeCourses ? showIcon(Icons.edit_note) : null,
      ],
    );
  }

  showOfficeHours() {
    List<Widget> officeHoursWidgets = [];

    for (var officeHour in mektaba.officeHours!) {
      officeHoursWidgets.add(Text("${officeHour.day} : ${officeHour.hours}"));
    }
    return officeHoursWidgets;
  }

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
                      image: DecorationImage(
                        image: NetworkImage(
                          mektaba.cover != null
                              ? mektaba.cover!
                              : "https://cdn.pixabay.com/photo/2016/02/16/21/07/books-1204029_1280.jpg",
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
                            child: Image.network(
                                mektaba.logo != null
                                    ? mektaba.logo!
                                    : "https://media.istockphoto.com/id/949118068/photo/books.webp?b=1&s=612x612&w=0&k=20&c=7LDdLrIwD1hH709wnAr--Yk0s82raIGuCgo7m09jvg0=",
                                height: 100,
                                width: 100,
                                fit: BoxFit.fitHeight)),
                        Container(
                          height: _screenSize.height / 9.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                mektaba.name,
                                style: TextStyle(
                                  fontFamily: 'Berlin',
                                  fontSize: 25,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  Text(
                                      "${mektaba.address}, ${mektaba.zipCode} ${mektaba.city}",
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
                          onTap: mektaba.phone != null ? onCall : () {}),
                      MektabaIcon(
                          icon: Icons.mail,
                          description: "Courriel",
                          onTap: mektaba.email != null ? onEmail : () {}),
                      MektabaIcon(
                        icon: Icons.location_on,
                        description: "Itinéraire",
                        onTap: () => openMapsSheet(
                            context,
                            "${mektaba.address}, ${mektaba.zipCode} ${mektaba.city}",
                            mektaba.name),
                      ),
                      MektabaIcon(
                          icon: Icons.language,
                          description: "Site web",
                          onTap: mektaba.website != null
                              ? navigateToWebsite
                              : () {}),
                      MektabaIcon(
                        icon: Icons.facebook_rounded,
                        description: "Social",
                        onTap: () {
                          if (mektaba.instagram != null ||
                              mektaba.facebook != null ||
                              mektaba.whatsapp != null) {}
                          showSocialMedia(context);
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
                    Text(mektaba.description != null
                        ? mektaba.description!
                        : "Aucune description n'est fournie"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Informations diverses",
                        style: TextStyle(fontSize: 16)),
                    Divider(),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 64),
                        child: showIcons()),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Horaire", style: TextStyle(fontSize: 16)),
                    Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: mektaba.officeHours != null
                          ? showOfficeHours()
                          : [Text("Aucun horaire n'est fourni")],
                    )
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
