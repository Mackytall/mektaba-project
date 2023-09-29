import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:test/config/sizes.dart';
import 'package:test/models/stock.dart';
// import 'package:test/models/stockWithPopulate.dart';
import 'package:test/pages/books/book_detail.dart';
import 'package:test/utils/utils.dart';
import 'package:test/widget/app_bar_builder.dart';
import 'package:test/models/mektaba.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage(
      {super.key, required this.approvedMembers, required this.mektabaId});

  final List<Member>? approvedMembers;
  final mektabaId;
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late List<dynamic> stocks = [];
  final TextEditingController _searchController = TextEditingController();
  late Future futureStocks;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureStocks = getStocksByMektaba(widget.mektabaId);
  }

  void filterStocks(snapshotData) async {
    // if (!isStocksFiltered) {
    // isStocksFiltered = true;
    // final allStocks = await getStocksByMektaba("64d5e04a0d0ecda58e0678aa");
    Map<String, List<StockWithBookDet>> stocksByBookId = {};
    for (var stock in snapshotData) {
      if (!stocksByBookId.containsKey(stock.book.id)) {
        stocksByBookId[stock.book.id] = [];
      }
      stocksByBookId[stock.book.id]!.add(stock);
    }

    for (var key in stocksByBookId.keys) {
      var values = stocksByBookId[key]!;
      var selectedStock = values.firstWhere(
        (stock) => stock.status == StockStatus.available,
        orElse: () => values.firstWhere(
          (stock) => stock.status == StockStatus.reserved,
          orElse: () => values.firstWhere(
            (stock) => stock.status == StockStatus.loan,
          ),
        ),
      );
      if (selectedStock != null) {
        stocks.add(selectedStock);
      }
    }
    // }
  }

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
                      'Favoris',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Sizes.h2),
                    ),
                  ],
                ),
                const Text("Liste des ouvrages favoris dans la mektaba"),

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
                    child: FutureBuilder(
                        future: futureStocks,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Erreur: ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data.isEmpty) {
                            return Text('Aucune donnée disponible.');
                          } else {
                            filterStocks(snapshot.data!);
                            return ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 10,
                              ),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: stocks.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BookDetail(
                                                  approvedMembers:
                                                      widget.approvedMembers,
                                                  stock: stocks[index],
                                                  mektabaId: widget.mektabaId,
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
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  8,
                                              child: Row(children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        right: 16),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            8,
                                                    child: FittedBox(
                                                        fit: BoxFit.fitWidth,
                                                        child: Image.asset(
                                                            'assets/pictures/wajiz.jpg'))),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                      child: Text(
                                                        stocks[index]
                                                            .book
                                                            .title,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Text(
                                                      stocks[index].book.author,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      stocks[index]
                                                          .book
                                                          .edition,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF4B9A6F),
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.7,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            labelizeStockStatus(
                                                                stocks[index]
                                                                    .status),
                                                            const Icon(
                                                                Icons.favorite)
                                                          ],
                                                        ))
                                                  ],
                                                )
                                              ]))),
                                    ));
                              },
                            );
                          }
                        }))
              ],
            )),
      ),
    );
  }
}
