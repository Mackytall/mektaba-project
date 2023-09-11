import 'package:flutter/material.dart';
import 'package:test/models/mektaba.dart';
import 'package:test/pages/mektaba/mektaba_owner/member/add_a_mektaba.dart';
import 'package:test/services/ApiService.dart';
import 'package:test/widget/app_bar_builder.dart';

class ListMektaba extends StatefulWidget {
  const ListMektaba({
    super.key,
    //required this.stocks,
  });

  //final stocks;
  @override
  State<ListMektaba> createState() => _ListMektaba();
}

class _ListMektaba extends State<ListMektaba> {
  final TextEditingController _searchController = TextEditingController();
  late Future<dynamic> futureMektabas;

  @override
  void initState() {
    super.initState();
    futureMektabas =
        ApiService().apiCall(ApiService().mektabas, Mektaba.fromJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(goBackIcon: true, actionIcon: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddMektaba();
              },
            ),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 35,
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Liste des mektaba',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Berlin',
                    fontSize: 18),
              ),
              const Text("Création / modification / affichage des mektaba"),
              const SizedBox(
                height: 20,
              ),
              // Filters
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("FILTRES".toUpperCase()),
                  const Icon(Icons.filter_list)
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              //LISTE DES ETABLISSEMENT
              Expanded(
                  child: FutureBuilder(
                      future: futureMektabas,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10,
                              height: 10,
                              child: Divider(),
                            ),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  //image
                                  // 1)TODO: CHANGER LES INFORMATIONS POUR PRENDRE CEUX DE LA BASE DE DONNEES
                                  // Image.network(
                                  //   snapshot.data[index].logo,
                                  //   height: 50.0,
                                  // ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  //Partie Texte
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data[index].name,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.6,
                                        child: Text(
                                          "${snapshot.data[index].address}, ${snapshot.data[index].zipCode}, ${snapshot.data[index].city}, ${snapshot.data[index].country}",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              '${snapshot.error} occurred',
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
