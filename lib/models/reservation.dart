import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:test/models/mektaba.dart';
import 'package:test/utils/requests.dart';

part 'reservation.g.dart';

enum ReservationStatus { loan, available, reserved, deleted }

@JsonSerializable(explicitToJson: true)
class Reservation {
  @JsonKey(name: '_id')
  String user;
  String mektaba;
  String stock;
  ReservationStatus status;
  String createdAt;
  String updatedAt;

  Reservation({
    required this.user,
    required this.mektaba,
    required this.stock,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Connect the generated [_$ReservationFromJson] function to the `fromJson`
  /// factory.
  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);

  /// Connect the generated [_$ReservationToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ReservationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReserveStock {
  String user;
  String mektaba;

  ReserveStock({required this.user, required this.mektaba});

  /// Connect the generated [_$ReserveStockFromJson] function to the `fromJson`
  /// factory.
  factory ReserveStock.fromJson(Map<String, dynamic> json) =>
      _$ReserveStockFromJson(json);

  /// Connect the generated [_$ReserveStockToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ReserveStockToJson(this);
}

class ReservationRes {
  bool success;
  String? status;
  String message;

  ReservationRes({required this.success, this.status, required this.message});
}

const reservationUrl =
    "https://mektaba.imadelmahrad.com/api/mektaba/reservations";
Future<ReservationRes> reserveStock(
    String stockId, ReserveStock reservationData) async {
  try {
    final response = await http.post(
        Uri.parse("$reservationUrl/stocks/$stockId"),
        headers: getHeaders(),
        body: jsonEncode(reservationData.toJson()));
    final parsed = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ReservationRes(
          success: true,
          status: parsed['status'],
          message: "Vous venez de réserver un livre.");
    } else {
      return ReservationRes(success: false, message: parsed['message']);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    throw Exception("Failed to reserve the stock");
  }
}

Future<ReservationRes> deleteReservation(
    String stockId, ReserveStock reservationData) async {
  try {
    final response = await http.delete(
        Uri.parse("$reservationUrl/stocks/$stockId"),
        headers: getHeaders(),
        body: jsonEncode(reservationData.toJson()));
    final parsed = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ReservationRes(
          success: true,
          status: parsed['status'],
          message: "Réservation supprimé");
    } else {
      return ReservationRes(success: false, message: parsed['message']);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    throw Exception("Failed to reserve the stock");
  }
}

Future<bool> isStockReservedByUser(
    String stockId, ReserveStock reservationData) async {
  try {
    final response = await http.post(
        Uri.parse("$reservationUrl/stocks/verify/$stockId"),
        headers: getHeaders(),
        body: jsonEncode(reservationData.toJson()));
    final parsed = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return parsed;
    }
    return false;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    throw Exception("Failed to reserve the stock");
  }
}
