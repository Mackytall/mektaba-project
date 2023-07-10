import 'package:flutter/material.dart';
import 'package:test/widget/app_bar_builder.dart';
import '../data/mektaba_data.dart';
import 'package:auto_size_text/auto_size_text.dart';


class BookDetail extends StatefulWidget {
  const BookDetail({super.key,});


  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Détail Livre',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Berlin',
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Container(
                    height: 20,
                    color: Colors.yellow,
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
                  Container(
                    height: 20,
                    color: Colors.yellow,
                  ),

//  Book reservation
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Padding(
                  //         padding: EdgeInsets.only(right: 16),
                  //         child: Image.asset(
                  //           'assets/pictures/wajiz.jpg',
                  //           width: MediaQuery.of(context).size.width / 2,
                  //           height: MediaQuery.of(context).size.height / 5,
                  //         )),
                  //     Expanded(
                  //       child: Container(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               "EN PRET".toUpperCase(),
                  //               style: TextStyle(
                  //                 color: Color(0xFFD88513),
                  //               ),
                  //             ),
                  //             Row(
                  //               children: [
                  //                 Icon(
                  //                   Icons.favorite,
                  //                   color: Colors.grey,
                  //                 ),
                  //                 Icon(
                  //                   Icons.share,
                  //                   color: Colors.grey,
                  //                 )
                  //               ],
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Container(
                  //   child: TabBar(tabs: [
                  //   Tab(text: 'Places'),
                  //   Tab(text: 'Inspiration'),
                  //   Tab(text: 'Emotions'),
                  // ],)
                  // )

                  // SingleChildScrollView(
                  //   child:
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
                                child: Text("Description"),
                              )),
                              Tab(
                                  child: Container(
                                child: Text("Détails"),
                              ))
                            ]),
                            Container(
                                color: Colors.red,
                                height: MediaQuery.of(context).size.height / 3,
                                width: 500,
                                child: TabBarView(
                                    controller: _tabController,
                                    children: [
                                      AutoSizeText("Salam"),
                                      AutoSizeText("Salam"),
                                    ]))
                          ],
                        ),
                      )
                    ],
                  ),
                  // )
                ])),
      )),
    );
  }
}
