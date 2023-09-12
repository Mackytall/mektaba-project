import 'package:flutter/material.dart';
import 'package:test/models/stock.dart';
import 'package:test/models/stockWithBookDetail.dart';
import 'package:test/pages/auth/sign_up.dart';
import 'package:test/pages/books/book_consultation.dart';
import 'package:test/pages/auth/login.dart';
import 'package:test/pages/books/book_detail.dart';
import 'package:test/pages/books/add_book/add_book.dart';
import 'package:test/pages/events/event_detail.dart';
import 'package:test/pages/mektaba/mektaba_detail.dart';
import 'package:test/pages/mektaba/mektaba_owner/member/add_a_mektaba.dart';
import 'package:test/pages/mektaba/mektaba_owner/member/list_of_mektaba.dart';
import 'package:test/pages/membership/member_validation.dart';
import 'package:test/pages/auth/profile.dart';
import 'package:test/services/ApiService.dart';
import 'package:test/pages/splash_screen.dart';
import 'package:test/utils/utils.dart';
import 'package:test/widget/app_bar_builder.dart';
import '../../../data/mektaba_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../../config/palette.dart';

class MektabaMainScreen extends StatelessWidget {
  const MektabaMainScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(buttonColor: Colors.yellow),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Palette.secondary,
        ),
        // textTheme: TextTheme(

        // ),
        useMaterial3: true,
      ),
      home: const Splash(),
      // home: const ListMektaba(),
      // home: SignUp(),
      // const TestApi()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();
  late Future<dynamic> futureStocks;
  late List<dynamic> stocks = [];
  var uniqueBooksId = [];

  void filterStocks() async {
    final allStocks = await getStocksByMektaba("64d5e04a0d0ecda58e0678aa");
    Map<String, List<StockWithBookDet>> stocksByBookId = {};
    for (var stock in allStocks) {
      if (!stocksByBookId.containsKey(stock.book.id)) {
        stocksByBookId[stock.book.id] = [];
      }
      stocksByBookId[stock.book.id]!.add(stock);
    }

    for (var key in stocksByBookId.keys) {
      var values = stocksByBookId[key]!;
      var selectedStock = values.firstWhere(
        (stock) => stock.status == "available",
        orElse: () => values.firstWhere(
          (stock) => stock.status == "reserved",
          orElse: () => values.firstWhere(
            (stock) => stock.status == "loan",
          ),
        ),
      );

      if (selectedStock != null) {
        stocks.add(selectedStock);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    filterStocks();
    // to remove when developping new books section
    futureStocks = getStocksByMektaba("64d5e04a0d0ecda58e0678aa");

    // ApiService().apiCall(
    //     ApiService().stocksWithBookDetail, StockWithBookDetail.fromJson);
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
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MektabaDetail()),
                            );
                          },
                          child: Image.asset(mektabas[0].logo,
                              height: 100, width: 100, fit: BoxFit.fitHeight))),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bienvenue dans la mektaba',
                            style:
                                TextStyle(fontFamily: 'Berlin', fontSize: 20)),
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
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(mektabas[0].fullAddress,
                                    // style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.left),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
//  Button
              // Container(
              //   color: Colors.blue,
              //   width: MediaQuery.of(context).size.width,
              // child:
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 3,
                        maximumSize: Size(
                            MediaQuery.of(context).size.width / 2.2,
                            MediaQuery.of(context).size.height / 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        surfaceTintColor: Colors.white),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4.5,
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
                        maximumSize: Size(
                            MediaQuery.of(context).size.width / 2.2,
                            MediaQuery.of(context).size.height / 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        surfaceTintColor: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.person_add),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4.5,
                            child: AutoSizeText('Demande d’adhésion',
                                style: TextStyle(color: Colors.black))),
                      ],
                    ),
                  ),
                ],
              ),
              // ),
              // Search bar
              SizedBox(
                height: 10,
              ),
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
// Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookConsultation(
                                    stocks: stocks,
                                  )),
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
                                    'Consulter \nouvrages ',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ]),
                              )))),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
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
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MemberValidation()),
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
                                  Icons.help,
                                  size: MediaQuery.of(context).size.width / 12,
                                ),
                                Text(
                                  'Foire Aux \nQuestions',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ]),
                            ))),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddBook()),
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
                                  Icons.sms,
                                  size: MediaQuery.of(context).size.width / 12,
                                ),
                                Text(
                                  'Contact /\nInfomations',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ]),
                            ))),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
// Event
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Évènements',
                    textAlign: TextAlign.start,
                  ),
                  const Divider(),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventDetail()),
                        );
                      },
                      child: Stack(
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
                                  child: Image.asset(
                                      'assets/pictures/event.jpg'))),
                          Positioned(
                              bottom: 10,
                              left: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Samedi 19 septembre 2023 | 18h-20',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
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
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Les Nouveautes',
                    textAlign: TextAlign.start,
                  ),
                  const Divider(),
                  FutureBuilder(
                      future: futureStocks,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          // the following code will
                          // loop over stocks from api call and saves books id in list.
                          //this will allow us to only display one copy of a book

                          // for (var stock in snapshot.data!) {
                          //   var bookId = stock.book.id;
                          //   if (uniqueBooksId.length == 0) {
                          //     uniqueBooksId.add(bookId);
                          //     stocks.add(stock);
                          //   } else {
                          //     if (uniqueBooksId.contains(bookId) == false) {
                          //       uniqueBooksId.add(bookId);
                          //       stocks.add(stock);
                          //     }
                          //   }
                          // }

                          // for (var stock in snapshot.data!) {
                          //   if (uniqueBooksId.contains(stock.book.id) ==
                          //       false) {
                          //     uniqueBooksId.add(stock.book.id);
                          //   }
                          // }
                          // for (var stock in snapshot.data!) {

                          // }
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: 10,
                                      ),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: stocks.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => BookDetail(
                                                    stock: stocks[index],
                                                  )),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          // Books
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
                                              // height: 100,
                                              child: AutoSizeText(
                                                stocks[index].book.title,
                                                style: TextStyle(
                                                    color: Colors.black),
                                                maxLines: 2,
                                              )),
                                        ],
                                      ),
                                    );
                                  }));
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return const CircularProgressIndicator();
                      }),
                ],
              ),
              // const SizedBox(
              //   height: 10,
              // ),
            ],
          ),
        ),
      )),
    );
  }
}
