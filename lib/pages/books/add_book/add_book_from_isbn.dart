

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test/widget/app_bar_builder.dart';

class AddBookFromIsbn extends StatefulWidget {
  @override
  State<AddBookFromIsbn> createState() => _AddBookFromIsbnState();
}

class _AddBookFromIsbnState extends State<AddBookFromIsbn>

    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _onlyAvailableOnSite = false;
    List<DropdownMenuItem<String>> categories = [
    DropdownMenuItem(child: Text("Politique"), value: "Politique"),
    DropdownMenuItem(child: Text("Histoire"), value: "Histoire"),
    DropdownMenuItem(child: Text("Spiritualité"), value: "Spiritualité"),
    DropdownMenuItem(child: Text("Enfant"), value: "Enfant"),
  ];
  String? selectedCategory;
  // add themes dropdown list et selected theme variable

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(goBackIcon: true, actionIcon: false),
      body: SingleChildScrollView(
          child: Center(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Text(
                        'Ajouter un ouvrage',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Berlin',
                            fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
// Book title
                  Text(
                    "Les Prophètes racontés aux enfants",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Berlin',
                        fontSize: 15),
                  ),
                  Text("Editions Tawhid"),
                  const SizedBox(
                    height: 20,
                  ),

//  Book reservation
                  Row(

                    children: [
                      Flexible(
                          child: 
                          Image.asset(
                            alignment: Alignment.topLeft,
                            'assets/pictures/wajiz.jpg',
                            width: MediaQuery.of(context).size.width / 1.6,
                            height: MediaQuery.of(context).size.height / 4,
                          ),
                          ),

                      Flexible(
                        child: 
                        Container(
                          alignment: Alignment.bottomLeft,
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: MediaQuery.of(context).size.height / 4,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Checkbox(value: _onlyAvailableOnSite, 
                              onChanged: (bool? value) {
                                setState(() {
                                  _onlyAvailableOnSite = value!;
                                });} ),
                                Flexible(child: Text("Consultable uniquement sur place",
                                ))
                              
                            
                          ],)
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
// Drop downs   
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: 
                DropdownButtonFormField(
                         
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            label: Text("Catégorie",
                                style: TextStyle(fontSize: 16)),
                          ),
                          value: selectedCategory,
                          items: categories,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue!;
                            });
                          },
                        )),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: 
                DropdownButtonFormField(
                      // add themes dropdown list et selected theme variable
     
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            label: Text("Thèmes",
                                style: TextStyle(fontSize: 16)),
                          ),
                          value: selectedCategory,
                          items: categories,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue!;
                            });
                          },
                        )),


// TAB BAR
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            TabBar(controller: _tabController, tabs: [
                              Tab(
                                  child: Container(
                                child: const Text("Description"),
                              )),
                              Tab(
                                  child: Container(
                                child: const Text("Détails"),
                              ))
                            ]),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                padding: const EdgeInsets.all(8),
                                width: 500,
                                child: TabBarView(
                                    controller: _tabController,
                                    children: [
                                      SingleChildScrollView(
                                        child: Text(
                                          "Par la grâce d'Allah, un nombre important d'œuvres présentant les aspects les plus importants du fiqh sont à présent disponibles dans de nombreuses langues. Cependant, Le Wajiz ou le sommaire de la jurisprudence à la lumière de la Sounna et du Coran, aux aspects uniques en son genre, l'ont rendu très populaire dans sa langue d'origine, l'arabe, et, si Allah le veut, il contribuera également de manière importante à la littérature islamique disponible en français. L'auteur a, d'une part, restreint les sources d'où il tire les règles du fiqh, au Coran et aux hadiths authentiques du Prophète (Paix et Bénédictions d'Allah sur lui), tout en prenant grand soin d'éviter les hadiths faibles ou rejetés que l'on trouve encore dans bien des livres de fiqh. Pour s'assurer davantage que son œuvre soit une fiabilité exemplaire, l'auteur a, d'autre part, limité ses commentaires à ce qui provient directement du Coran et de la Sounna pour le mettre ainsi hors de portée des critiques. Il s'est enfin efforcé d'éviter les polémiques dans lesquels les juristes sont souvent entraînés, afin de proposer une œuvre dans laquelle les lecteurs peuvent avoir une confiance totale. Ce livre s'adresse tant à tous ceux qui désirent approfondir leur connaissance des règles de base qui régissent le quotidien du musulman pieux, qu'à ceux qui déjà sont déjà familiers avec un certain nombre de ces règles, et qui désirent avoir à portée de main un recueil condensé et facile d'accès.",
                                        ),
                                      ),
                                      SingleChildScrollView(
                                          child: Text(
                                              "AUTEUR : Siham Andalouci \nEDITIONS : Tawhid \nANNE : 2019 \nLANGUE : Français \nNOMBRE DE PAGES : 176 \nEAN13 : 9782848624181 \nTHEME : Histoires, Prophètes, Coran, Enfants")),
                                    ]))
                          ],
                        ),
                      )
                    ],
                  ),
                ])),
      )),
    );
  }
}
