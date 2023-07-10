import 'package:flutter/material.dart';
import 'package:test/book_consultation.dart';
import 'package:test/widget/app_bar_builder.dart';
import '../data/mektaba_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';

class MektabaMainScreen extends StatelessWidget {
  const MektabaMainScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF4B9A6F),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();

  Future<Coords> getGeoCoderData(address) async {
    List<Location> locations = await locationFromAddress(address);
    return Coords(locations.first.latitude, locations.first.longitude);
  }

  openMapsSheet(context, address, name) async {
    try {
      final coords = await getGeoCoderData(address);
      final title = name;
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print("Erreur lors de l'ouverture de l'application de cartes : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(goBackIcon: false, actionIcon: false),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),

// Mektaba main screen's Header
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Image.asset(mektabas[0].logo,
                          height: 100, width: 100, fit: BoxFit.fitHeight)),
                  Expanded(
                    child: Container(
                      //color: Colors.blue,
                      //height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bienvenue dans la mektaba',
                              style: TextStyle(
                                  fontFamily: 'Berlin', fontSize: 20)),
                          Text(
                            mektabas[0].name,
                            style: TextStyle(
                              fontFamily: 'Berlin',
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          InkWell(
                            onTap: () => openMapsSheet(context,
                                mektabas[0].fullAddress, mektabas[0].name),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Color(0xFF4B9A6F),
                                ),
                                Text(mektabas[0].fullAddress,
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.left),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
//  Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        surfaceTintColor: Colors.white),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.favorite),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: Text('Ajouter en favoris',
                                style: TextStyle(
                                  color: Colors.black,
                                ))),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        surfaceTintColor: Colors.white),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.person_add),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: AutoSizeText('Demande d’adhésion',
                                style: TextStyle(color: Colors.black))),
                      ],
                    ),
                  ),
                ],
              ),
// Search bar
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Tapez un ouvrage, un auteur, ect...',
                    // Add a clear button to the search bar
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.cancel,
                      ),
                      onPressed: () => _searchController.clear(),
                    ),
                    // Add a search icon or button to the search bar
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Perform the search here
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
              ),
              Container(
                height: 10,
                //color: Colors.yellow,
              ),
// Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BookConsultation()),
                        );
                      },
                      child: Card(
                          surfaceTintColor: Colors.white,
                          elevation: 3,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 5,
                                child: Column(children: [
                                  Icon(
                                    Icons.library_books,
                                    size:
                                        MediaQuery.of(context).size.width / 12,
                                  ),
                                  Text(
                                    'Consulter ouvrages ',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ]),
                              )))),
                  Card(
                      surfaceTintColor: Colors.white,
                      elevation: 3,
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                            child: Column(children: [
                              Icon(
                                Icons.favorite,
                                size: MediaQuery.of(context).size.width / 12,
                              ),
                              Text(
                                'Mes favoris\n',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ))),
                  Card(
                      surfaceTintColor: Colors.white,
                      elevation: 3,
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                            child: Column(children: [
                              Icon(
                                Icons.help,
                                size: MediaQuery.of(context).size.width / 12,
                              ),
                              Text(
                                'Foire Aux Questions',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ))),
                  Card(
                      surfaceTintColor: Colors.white,
                      elevation: 3,
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                            child: Column(children: [
                              Icon(
                                Icons.sms,
                                size: MediaQuery.of(context).size.width / 12,
                              ),
                              Text(
                                'Contact / Infomations',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
// Event
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Évenements',
                    textAlign: TextAlign.start,
                  ),
                  Divider(),
                  Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade300,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Image.asset('assets/pictures/event.jpg'))),
                      Positioned(
                          bottom: 10,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Samedi 19 septembre 2023 | 18h-20',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                'Rencontre avec Sofiane Meziani',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Berlin',
                                    fontSize: 18),
                              ),
                            ],
                          ))
                    ],
                  )
                ],
              ),
              Container(
                height: 10,
                //color: Colors.yellow,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Les Nouveautes',
                    textAlign: TextAlign.start,
                  ),
                  Divider(),
                  Row(
                    children: [
                      Column(
                        children: [
                          // Livres
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                              ),
                              width: 80,
                              height: 120,
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Image.asset(
                                      'assets/pictures/wajiz.jpg'))),
                          SizedBox(
                              width: 80,
                              child: AutoSizeText(
                                'Le prophete racontes aux salam',
                                style: TextStyle(color: Colors.black),
                                maxLines: 2,
                              )),

                          // Container(**********
                          //     width: 80,
                          //     child: AutoSizeText(
                          //       'Le prophete racontes aux salam',
                          //     )),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          // Livres
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                              ),
                              width: 80,
                              height: 120,
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Image.asset(
                                      'assets/pictures/wajiz.jpg'))),
                          SizedBox(
                              width: 80,
                              child: AutoSizeText(
                                'Le prophete racontes aux salam',
                                style: TextStyle(color: Colors.black),
                                maxLines: 2,
                              )),

                          // Container(
                          //     width: 80,
                          //     child: AutoSizeText(
                          //       'Le prophete racontes aux salam',
                          //     )),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          // Livres
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                              ),
                              width: 80,
                              height: 120,
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Image.asset(
                                      'assets/pictures/wajiz.jpg'))),
                          SizedBox(
                              width: 80,
                              child: AutoSizeText(
                                'Le prophete racontes aux salam',
                                style: TextStyle(color: Colors.black),
                                maxLines: 2,
                              )),

                          // Container(
                          //     width: 80,
                          //     child: AutoSizeText(
                          //       'Le prophete racontes aux salam',
                          //     )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
