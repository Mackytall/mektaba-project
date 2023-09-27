import 'package:flutter/material.dart';
import 'package:test/models/stock.dart';
import 'package:test/models/mektaba.dart';
import 'package:test/models/stockWithBookDetail.dart';
import 'package:test/pages/auth/sign_up.dart';
import 'package:test/pages/books/book_consultation.dart';
import 'package:test/pages/auth/login.dart';
import 'package:test/pages/books/book_detail.dart';
import 'package:test/pages/books/add_book/add_book.dart';
import 'package:test/pages/events/event_detail.dart';
import 'package:test/pages/faq.dart';
import 'package:test/pages/mektaba/mektaba_detail.dart';
import 'package:test/pages/mektaba/mektaba_owner/member/add_a_mektaba.dart';
import 'package:test/pages/mektaba/mektaba_owner/member/list_of_mektaba.dart';
import 'package:test/pages/membership/member_validation.dart';
import 'package:test/pages/auth/profile.dart';
import 'package:test/providers/providers.dart';
import 'package:test/services/ApiService.dart';
import 'package:test/pages/splash_screen.dart';
import 'package:test/utils/utils.dart';
import 'package:test/widget/app_bar_builder.dart';
import '../../../data/mektaba_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../../config/palette.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

class MyHomePage extends HookConsumerWidget {
  MyHomePage({super.key});
  final TextEditingController _searchController = TextEditingController();
  // late Future<dynamic> futureStocks;
  late List<dynamic> stocks = [];
  bool isStocksFiltered = false;
  showCancelConfirmationDialog(BuildContext context, void Function() onCancel) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Align(
            alignment: Alignment.center,
            child: AlertDialog(
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Êtes-vous sûr de vouloir annuler votre demande d'adhésion ?",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Non",
                          style: TextStyle(color: Palette.quaternary))),
                  TextButton(
                      onPressed: () {
                        onCancel();
                      },
                      child: Text("Oui")),
                ]));
      },
    );
  }

  void filterStocks() async {
    if (!isStocksFiltered) {
      isStocksFiltered = true;
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
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = useState<String?>(null);
    final membershipStatus = useState<String?>(null);
    final membershipText = useState<String?>("Demande d'adhésion");
    final isMektabaLoaded = useState<bool>(false);
    final isMektabaMembersLoaded = useState<bool>(false);
    // final membershipText = useState<String?>("Adhésion en attente");
    final membershipTextColor = useState<Color?>(Colors.black);
    final membershipBackgroundColor = useState<Color?>(null);
    final mektaba = useState<Mektaba?>(null);
    List<Member>? members = [];
    List<Member>? approvedMembers = [];
    final dynamic user = ref.watch(authProvider);
    filterStocks();
    const mektabaId = "650d4ce3f9250a9b6fed6765";
    // const mektabaId = "65057e681cbe4e353b0f93c8"; // on local
    final futureStocks = getStocksByMektaba(mektabaId);
    Future<MektabaRes> futureMektaba = getMektaba(mektabaId);

    void initializeApprovedMembers() {
      if (members != null) {
        approvedMembers
            .addAll(members!.where((member) => member.status == "approved"));
      }
    }

    void getMembershipStatus() {
      for (Member member in members!) {
        if (member.user == user.id) {
          if (member.status == "approved") {
            membershipStatus.value = "approved";
            membershipText.value = "Adhérent";
            membershipTextColor.value = Colors.white;
            membershipBackgroundColor.value = Palette.secondary;
          } else if (member.status == "pending") {
            membershipStatus.value = "pending";
            membershipText.value = "Adhésion en attente";
            membershipTextColor.value = Colors.white;
            membershipBackgroundColor.value = Palette.tertiary;
          } else if (member.status == "refused") {
            membershipStatus.value = "refused";
            membershipText.value = "Adhésion refusé";
            membershipTextColor.value = Colors.white;
            membershipBackgroundColor.value = Palette.quaternary;
          }
        }
      }
    }

    void initializeMektaba() {
      futureMektaba.then((data) {
        mektaba.value = data.mektaba!;
        isMektabaLoaded.value = true;
        members = mektaba.value!.members;
        isMektabaMembersLoaded.value = true;
        initializeApprovedMembers();
        if (user != null) {
          if (members == null) {
            return false;
          }
          if (members != null) {
            getMembershipStatus();
          }
        }
      });
    }

    initializeMektaba();

    void onSubscribe() async {
      String userId = user.id;
      final subcribeRes = await subscribe(mektabaId, userId);
      print("subcribeRes.status");
      print(subcribeRes.status);
      if (subcribeRes.status != null) {
        print("subcribeRes.status != null");
        print(subcribeRes.status);
        membershipStatus.value = subcribeRes.status;
        membershipText.value = subcribeRes.message;
        membershipTextColor.value = Colors.white;
        membershipBackgroundColor.value = Palette.tertiary;
      } else if (subcribeRes.error != null || subcribeRes.message != null) {
        error.value = subcribeRes.error;
        print(error.value);
      } else if (subcribeRes.message != null) {
        error.value = subcribeRes.message;
        print(error.value);
      } else {
        error.value = "Un problème est survenu, veuillez réessayer";
      }
    }

    void onCancel() async {
      String userId = user.id;
      final subcribeRes = await cancelMembershipRequest(mektabaId, userId);
      if (subcribeRes.success == true) {
        membershipStatus.value = subcribeRes.status;
        membershipText.value = subcribeRes.message;
        membershipTextColor.value = Colors.black;
        membershipBackgroundColor.value = null;
        Navigator.of(context).pop();
      } else if (subcribeRes.error != null) {
        error.value = subcribeRes.error;
        print(error.value);
      } else {
        error.value = "Un problème est survenu, veuillez réessayer";
        print(error.value);
      }
    }

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
              mektaba.value == null
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MektabaDetail(
                                              mektaba: mektaba.value!,
                                            )),
                                  );
                                },
                                child: Image.network(
                                    mektaba.value!.logo != null
                                        ? mektaba.value!.logo!
                                        : "https://media.istockphoto.com/id/949118068/photo/books.webp?b=1&s=612x612&w=0&k=20&c=7LDdLrIwD1hH709wnAr--Yk0s82raIGuCgo7m09jvg0=",
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.fitHeight))),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Bienvenue dans la mektaba',
                                  style: TextStyle(
                                      fontFamily: 'Berlin', fontSize: 20)),
                              Text(
                                mektaba.value!.name,
                                style: TextStyle(
                                  fontFamily: 'Berlin',
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              InkWell(
                                onTap: () => openMapsSheet(
                                    context,
                                    "${mektaba.value!.address}, ${mektaba.value!.zipCode} ${mektaba.value!.city}",
                                    mektaba.value!.name),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color(0xFF4B9A6F),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                          "${mektaba.value!.address}, ${mektaba.value!.zipCode} ${mektaba.value!.city}",
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
                  // favoris
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            left: 1, right: 10, bottom: 8, top: 2),
                        elevation: 3,
                        // maximumSize: Size(
                        //     MediaQuery.of(context).size.width / 2.2,
                        //     MediaQuery.of(context).size.height / 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        surfaceTintColor: Colors.white,
                        backgroundColor: null),
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite, color: Palette.secondary),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: MediaQuery.of(context).size.width / 3.3,
                            child: AutoSizeText('Ajouter en favoris',
                                style: TextStyle(
                                  color: Colors.black,
                                ))),
                      ],
                    ),
                  ),
                  // membership
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                        padding: EdgeInsets.only(
                            left: 10, right: 10, bottom: 8, top: 2),
                        elevation: 3,
                        // maximumSize: Size(
                        //     MediaQuery.of(context).size.width / 2.2,
                        //     MediaQuery.of(context).size.height / 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        surfaceTintColor: Colors.white,
                        backgroundColor: membershipBackgroundColor.value),
                    onPressed: () {
                      if (user != null) {
                        if (membershipStatus.value == "approved" ||
                            membershipStatus.value == "refused") {
                          () {};
                        } else if (membershipStatus.value == "pending") {
                          showCancelConfirmationDialog(context, onCancel);
                        } else if (membershipStatus.value == null) {
                          onSubscribe();
                        }
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login(
                                    goBackAfterLogin: true,
                                  )),
                        );
                      }
                    },
                    child: Row(
                      children: [
                        Icon(Icons.person_add,
                            color: membershipTextColor.value == Colors.white
                                ? Colors.white
                                : Palette.secondary),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: MediaQuery.of(context).size.width / 3.3,
                            child: AutoSizeText(membershipText.value.toString(),
                                style: TextStyle(
                                  color: membershipTextColor.value,
                                ))),
                      ],
                    ),
                  )
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
                        isMektabaMembersLoaded.value
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookConsultation(
                                          approvedMembers: approvedMembers,
                                          mektabaId: mektabaId,
                                        )),
                              )
                            : () {};
                      },
                      child: Card(
                          surfaceTintColor: isMektabaMembersLoaded.value
                              ? Colors.white
                              : Palette.grey,
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
                        surfaceTintColor:
                            isMektabaLoaded.value ? Colors.white : Palette.grey,
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
                      isMektabaLoaded.value
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FaqPage(
                                        faq: mektaba.value!.faq,
                                      )),
                            )
                          : () {};
                    },
                    child: Card(
                        surfaceTintColor:
                            isMektabaLoaded.value ? Colors.white : Palette.grey,
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
                      isMektabaLoaded.value
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MektabaDetail(
                                        mektaba: mektaba.value!,
                                      )),
                            )
                          : () {};
                    },
                    child: Card(
                        surfaceTintColor:
                            isMektabaLoaded.value ? Colors.white : Palette.grey,
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
                                                    approvedMembers:
                                                        approvedMembers,
                                                    stock: stocks[index],
                                                    mektabaId: mektabaId,
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
