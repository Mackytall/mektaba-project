import 'package:flutter/material.dart';
import 'package:test/models/faq.dart';
import 'package:test/models/responsable.dart';

class UserModal extends ChangeNotifier {
  String? presentation;
  String? contactName;
  String? contactNumber;
  String? contactEmail;
  String? mektabakaUrl;
  String? mektabaFacebook;
  int? openLundi;
  int? closeLundi;
  int? openMardi;
  int? closeMardi;
  int? openMercredi;
  int? closeMercredi;
  int? openJeudi;
  int? closeJeudi;
  int? openVendredi;
  int? closeVendredi;
  int? openSamedi;
  int? closeSamedi;
  int? openDimanche;
  int? closeDimanche;
  int? dayLoan;
  int? maxLoan;
  double? priceLoan;
  double? priceLateLoanforDay;
  int? timeRegister;
  int? timeStatutReserve;
  bool reserve = true;
  List<Faq>? listFaq;
  List<Faq>? listInformation;
  List<Responsable>? listResponsable;
}
