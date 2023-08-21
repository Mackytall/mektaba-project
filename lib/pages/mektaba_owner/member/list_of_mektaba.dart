import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:test/models/stockWithPopulate.dart';
import 'package:test/pages/books/book_detail.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(goBackIcon: true, actionIcon: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                child: ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        //image
                        // 1)TODO: CHANGER LES INFORMATIONS POUR PRENDRE CEUX DE LA BASE DE DONNEES
                        Image.asset(
                          'assets/pictures/logo_tawhid.png',
                          height: 50.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        //Partie Texte
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Centre Tawhid',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '8 Rue Notre Dame, 69006 Lyon',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                    height: 10,
                    child: Divider(),
                  ),
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
