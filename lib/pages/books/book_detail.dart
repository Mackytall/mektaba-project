import 'package:flutter/material.dart';
import 'package:test/widget/app_bar_builder.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({
    super.key,
    this.stock,
  });

  final stock;

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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Row(
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
                  const SizedBox(
                    height: 20,
                  ),
// Book title
                  Text(
                    widget.stock.book.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Berlin',
                        fontSize: 15),
                  ),
                  Text(widget.stock.book.edition),
                  const SizedBox(
                    height: 20,
                  ),

//  Book reservation
                  Row(
                    children: [
                      Flexible(
                        child: Image.asset(
                          alignment: Alignment.topLeft,
                          'assets/pictures/wajiz.jpg',
                          width: MediaQuery.of(context).size.width / 1.6,
                          height: MediaQuery.of(context).size.height / 4,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: MediaQuery.of(context).size.height / 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.grey,
                                      ),
                                      Icon(
                                        Icons.share,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      "EN PRET".toUpperCase(),
                                      style: const TextStyle(
                                        color: Color(0xFFD88513),
                                      ),
                                    ),
                                  ),
                                  Text(widget.stock.status)
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0))),
                                child: const Text(
                                  "Réserver",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

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
                                          widget.stock.book.description,
                                        ),
                                      ),
                                      SingleChildScrollView(
                                          child: Text(
                                              "AUTEUR : ${widget.stock.book.author}, \nEDITIONS : ${widget.stock.book.edition} \nANNE : ${widget.stock.book.year} \nLANGUE : ${widget.stock.book.language.join(',')} \nNOMBRE DE PAGES : ${widget.stock.book.numberOfPages} \nEAN13 : ${widget.stock.book.ean13} ")),
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
