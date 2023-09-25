import 'package:flutter/material.dart';
import 'package:test/config/palette.dart';
import 'package:test/models/mektaba.dart';
import 'package:test/models/reservation.dart';
import 'package:test/models/stock.dart';
import 'package:test/pages/auth/login.dart';
import 'package:test/providers/providers.dart';
import 'package:test/utils/utils.dart';
import 'package:test/widget/app_bar_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test/widget/snapckBar.dart';

class BookDetail extends HookConsumerWidget {
  BookDetail({
    super.key,
    required this.approvedMembers,
    required this.stock,
    required this.mektabaId,
    // this.isStockReservedByUserFromBookConsultation
  });
  final List<Member>? approvedMembers;
  final stock;
  final mektabaId;
  // final isStockReservedByUserFromBookConsultation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dynamic user = ref.watch(authProvider);
    final reserveBouttonBackgroundColor = useState<Color>(Palette.secondary);
    // bool isActualStockReserved = false;
    // final _isStockReservedByUser = useState<bool>(false);

    final _tabController = useTabController(
        initialIndex: 0, initialLength: 2, vsync: useSingleTickerProvider());

    void updateReserveButton(status) {
      switch (status) {
        case StockStatus.available:
          reserveBouttonBackgroundColor.value = Palette.secondary;
        default:
          reserveBouttonBackgroundColor.value = Colors.grey;
      }
    }

    bool isUserApproved(userId) {
      if (approvedMembers == null) {
        return false;
      }
      for (Member member in approvedMembers!) {
        if (member.user == userId && member.status == "approved") {
          return true;
        }
      }
      return false;
    }

    updateReserveButton(stock.status);

    // void isStockReservedByUserFonction() async {
    //   print("isStockReservedByUserFromBookConsultation");
    //   print(isStockReservedByUserFromBookConsultation.value);
    //   if (user != null) {
    //     if (isStockReservedByUserFromBookConsultation.value == null) {
    //       _isStockReservedByUser.value = await isStockReservedByUser(
    //           stock.id, ReserveStock(user: user.id, mektaba: mektabaId));
    //     } else {
    //       print("norequet");
    //       _isStockReservedByUser.value =
    //           isStockReservedByUserFromBookConsultation.value;
    //     }
    //   }
    // }

    // useEffect(() {
    //   isStockReservedByUserFonction();
    // }, [user]);

    onReserve() async {
      ReserveStock reservationData =
          ReserveStock(user: user.id, mektaba: mektabaId);
      final ReservationRes reservationRes =
          await reserveStock(stock.id, reservationData);
      if (reservationRes.success == true) {
        // _isStockReservedByUser.value = true;
        stock.status = StockStatus.reserved;
        updateReserveButton(stock.status);
        showCustomSnackBar(context, Palette.secondary, reservationRes.message);
      } else if (reservationRes.success == false) {
        showCustomSnackBar(context, Palette.quaternary, reservationRes.message);
      } else {
        showCustomSnackBar(context, Palette.quaternary,
            "Un problème est survenu, veuillez réessayer");
      }
    }

    onCancel() async {
      ReserveStock reservationData =
          ReserveStock(user: user.id, mektaba: mektabaId);
      final ReservationRes reservationRes =
          await deleteReservation(stock.id, reservationData);
      if (reservationRes.success == true) {
        // _isStockReservedByUser.value = false;
        stock.status = StockStatus.available;
        updateReserveButton(stock.status);
        showCustomSnackBar(context, Palette.secondary, reservationRes.message);
      } else if (reservationRes.success == false) {
        showCustomSnackBar(context, Palette.quaternary, reservationRes.message);
      } else {
        showCustomSnackBar(context, Palette.quaternary,
            "Un problème est survenu, veuillez réessayer");
      }
    }

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
                    stock.book.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Berlin',
                        fontSize: 15),
                  ),
                  Text(stock.book.edition),
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: labelizeStockStatus(stock.status)),
                                ],
                              ),
                              // Visibility(
                              //     visible: _isStockReservedByUser.value,
                              //     child:
                              // ElevatedButton(
                              //   onPressed: () {},
                              //   style: ElevatedButton.styleFrom(
                              //       backgroundColor: Palette.quaternary,
                              //       foregroundColor: Colors.white,
                              //       shape: RoundedRectangleBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(0))),
                              //   child: Text(
                              //     "Supprimer".toUpperCase(),
                              //     style: TextStyle(fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                              // ),
                              // Visibility(
                              //     visible: !_isStockReservedByUser.value,
                              //     child:
                              ElevatedButton(
                                onPressed: () {
                                  if (stock.status != StockStatus.available) {
                                  } else if (user != null) {
                                    isUserApproved(user.id)
                                        ? onReserve()
                                        : showCustomSnackBar(
                                            context,
                                            Palette.quaternary,
                                            "Vous devez être adhérent pour pouvoir réserver");
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
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        reserveBouttonBackgroundColor.value,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0))),
                                child: Text(
                                  "Réserver".toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                              // ),
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
                                          stock.book.description,
                                        ),
                                      ),
                                      SingleChildScrollView(
                                          child: Text(
                                              "AUTEUR : ${stock.book.author}, \nEDITIONS : ${stock.book.edition} \nANNE : ${stock.book.year} \nLANGUE : ${stock.book.language.join(',')} \nNOMBRE DE PAGES : ${stock.book.numberOfPages} \nEAN13 : ${stock.book.ean13} ")),
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
