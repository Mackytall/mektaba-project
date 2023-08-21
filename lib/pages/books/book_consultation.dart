import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:test/models/stockWithPopulate.dart';
import 'package:test/pages/books/book_detail.dart';
import 'package:test/widget/app_bar_builder.dart';

class BookConsultation extends StatefulWidget {
  const BookConsultation({
    super.key,
    required this.stocks,
  });

  final stocks;
  @override
  State<BookConsultation> createState() => _BookConsultationState();
}

class _BookConsultationState extends State<BookConsultation> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(goBackIcon: true, actionIcon: false),
      body: Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Row(
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
                const Text("Liste des ouvrages accessible dans la mektaba"),
                const SizedBox(
                  height: 10,
                ),
// Search Bar
                Container(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Tapez un ouvrage, un auteur, ect...',
                      // clear button
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.cancel,
                        ),
                        onPressed: () => _searchController.clear(),
                      ),
                      // search icon or button
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
                const SizedBox(
                  height: 10,
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
// Book list
                Expanded(
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height / 1.7,
                    child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.stocks.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookDetail(
                                      stock: widget.stocks[index],
                                    )),
                          );
                        },
                        child: Card(
                          elevation: 3,
                          surfaceTintColor: Colors.white,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  child: Row(children: [
                                    Container(
                                        padding: EdgeInsets.only(right: 16),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                8,
                                        child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Image.asset(
                                                'assets/pictures/wajiz.jpg'))),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Text(
                                            "hello",
                                            // widget.stocks[index].book.title,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          widget.stocks[index].book.edition,
                                          style: TextStyle(
                                            color: Color(0xFF4B9A6F),
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.7,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "EN PRET".toUpperCase(),
                                                  style: TextStyle(
                                                    color: Color(0xFFD88513),
                                                  ),
                                                ),
                                                const Icon(Icons.favorite)
                                              ],
                                            ))
                                      ],
                                    )
                                  ]))),
                        ));
                  },
                ))

                // GestureDetector(
                //     onTap: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const BookDetail()),
                //       );
                //     },
                //     child: Card(
                //       elevation: 3,
                //       surfaceTintColor: Colors.white,
                //       child: Padding(
                //           padding:
                //               EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //           child: SizedBox(
                //               width: MediaQuery.of(context).size.width,
                //               height: MediaQuery.of(context).size.height / 9,
                //               child: Row(children: [
                //                 Container(
                //                     padding: EdgeInsets.only(right: 16),
                //                     // width:
                //                     //     MediaQuery.of(context).size.width / 5,
                //                     // height: 120,
                //                     child: FittedBox(
                //                         fit: BoxFit.fitWidth,
                //                         child: Image.asset(
                //                             'assets/pictures/wajiz.jpg'))),
                //                 Column(
                //                   mainAxisSize: MainAxisSize.max,
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text("Les Prophètes racontés aux enfants"),
                //                     Text(
                //                       "Editions Tawhid",
                //                       style: TextStyle(
                //                         color: Color(0xFF4B9A6F),
                //                         fontSize: 12,
                //                       ),
                //                     ),
                //                     SizedBox(
                //                         width:
                //                             MediaQuery.of(context).size.width /
                //                                 1.7,
                //                         child: Row(
                //                           mainAxisSize: MainAxisSize.max,
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Text(
                //                               "EN PRET".toUpperCase(),
                //                               style: TextStyle(
                //                                 color: Color(0xFFD88513),
                //                               ),
                //                             ),
                //                             const Icon(Icons.favorite)
                //                           ],
                //                         ))
                //                   ],
                //                 )
                //               ]))),
                //     )),
              ],
            )),
      ),
    );
  }
}
