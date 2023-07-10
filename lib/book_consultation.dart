import 'package:flutter/material.dart';
import 'package:test/book_detail.dart';
import 'package:test/widget/app_bar_builder.dart';
import '../data/mektaba_data.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BookConsultation extends StatefulWidget {
  const BookConsultation({super.key});

  @override
  State<BookConsultation> createState() => _BookConsultationState();
}

class _BookConsultationState extends State<BookConsultation> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(goBackIcon: true, actionIcon: false),
      body: SingleChildScrollView(
          child: Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Consultation',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Berlin',
                          fontSize: 18),
                    ),
                  ],
                ),
                Text("Liste des ouvrages accessible dans la mektaba"),
                SizedBox(
                  height: 10,
                ),
// Search Bar
                Container(
                  // Add padding around the search bar
                  //padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // Use a Material design search bar
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
                SizedBox(
                  height: 10,
                ),
// Filters
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("FILTRES".toUpperCase()),
                    Icon(Icons.filter_list)
                  ],
                ),
                Divider(),
// Book list
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookDetail()),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 9,
                              child: Row(children: [
                                Container(
                                    padding: EdgeInsets.only(right: 16),
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    height: 120,
                                    child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Image.asset(
                                            'assets/pictures/wajiz.jpg'))),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Les Prophètes racontés aux enfants"),
                                    Text(
                                      "Editions Tawhids",
                                      style: TextStyle(
                                        color: Color(0xFF4B9A6F),
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.7,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "EN PRET".toUpperCase(),
                                              style: TextStyle(
                                                color: Color(0xFFD88513),
                                              ),
                                            ),
                                            Icon(Icons.favorite)
                                          ],
                                        ))
                                  ],
                                )
                              ]))),
                    )),
              ],
            )),
      )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
