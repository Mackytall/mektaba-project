import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:test/utils/requests.dart';

part 'mektaba.g.dart';

enum TimeUnits { day, month, year }

@JsonSerializable(explicitToJson: true)
class OfficeHours {
  String day;
  String hours;

  OfficeHours({required this.day, required this.hours});

  /// Connect the generated [_$OfficeHoursFromJson] function to the `fromJson`
  /// factory.
  factory OfficeHours.fromJson(Map<String, dynamic> json) =>
      _$OfficeHoursFromJson(json);

  /// Connect the generated [_$OfficeHoursToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$OfficeHoursToJson(this);
}

// class Faq {
//   String question;
//   String response;

//   Faq({
//     required this.question,
//     required this.response,
//   });
// }

// enum OfficeHours { day, hours }

@JsonSerializable(explicitToJson: true)
class Mektaba {
  @JsonKey(name: '_id')
  String id;
  String name;
  String? description;
  String? logo;
  String? cover;
  String address;
  String? adressComplement;
  String zipCode;
  String city;
  String country;
  String? phone;
  String? email;
  int? loanDuration;
  TimeUnits? loanUnit;
  int? simultaneousLoans;
  String? loanCost;
  String? lateCost;
  String? membershipPeriod;
  int? reservedStatusDuration;
  TimeUnits? reservedStatusDurationUnit;
  bool disableReservedOption;
  List<Object>? faq; // maybe we can make the type stronger
  List<OfficeHours>? officeHours; // maybe we can make the type stronger
  bool accessibleToEveryone;
  bool canPerformAblution;
  bool canPray;
  bool canTakeCourses;
  List<String>? employees;
  List<Member>? members;
  String owner;
  bool isEnabled;
  String? website;
  String? facebook;
  String? whatsapp;
  String? instagram;

  Mektaba({
    required this.id,
    required this.name,
    this.description,
    this.logo,
    this.cover,
    required this.address,
    this.adressComplement,
    required this.zipCode,
    required this.city,
    required this.country,
    this.phone,
    this.email,
    this.loanDuration,
    this.loanUnit,
    this.simultaneousLoans,
    this.loanCost,
    this.lateCost,
    this.membershipPeriod,
    this.reservedStatusDuration,
    this.reservedStatusDurationUnit,
    this.disableReservedOption = false,
    this.faq,
    this.officeHours,
    this.accessibleToEveryone = false,
    this.canPerformAblution = false,
    this.canPray = false,
    this.canTakeCourses = false,
    this.employees,
    this.members,
    required this.owner,
    this.isEnabled = false,
    this.website,
    this.facebook,
    this.whatsapp,
    this.instagram,
  });

  /// Connect the generated [_$MektabaFromJson] function to the `fromJson`
  /// factory.
  factory Mektaba.fromJson(Map<String, dynamic> json) =>
      _$MektabaFromJson(json);

  /// Connect the generated [_$MektabaToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MektabaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Member {
  String user;
  String status;
  String requestDate;

  Member({
    required this.user,
    required this.status,
    required this.requestDate,
  });

  /// Connect the generated [_$MemberFromJson] function to the `fromJson`
  /// factory.
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  /// Connect the generated [_$MemberToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MemberToJson(this);
}

class MektabaRes {
  Mektaba? mektaba;
  String? errorMessage;

  MektabaRes({this.mektaba, this.errorMessage});
}

// const mektabaUrl = "http://localhost:4000/api/mektaba/mektabas";
const mektabaUrl = "https://mektaba.imadelmahrad.com/api/mektaba/mektabas";

final mektabaCache = AsyncCache<MektabaRes>(const Duration(seconds: 30));
Future<MektabaRes> getMektaba(String id) async {
  return mektabaCache.fetch(() async {
    try {
      final response = await http.get(Uri.parse("$mektabaUrl/$id"));
      final parsed = json.decode(response.body);
      if (response.statusCode == 200) {
        final parsedMektaba = parsed['mektaba'];
        final mektaba = Mektaba.fromJson(parsedMektaba);
        return MektabaRes(mektaba: mektaba);
      }
      final errorMessage = parsed["error"];
      return MektabaRes(errorMessage: errorMessage);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return MektabaRes(
          errorMessage: "Un problème est survenu, veuillez réessayer");
    }
  });
}

class SubscribeRes {
  String? status;
  String? message;
  String? error;
  bool? success;

  SubscribeRes({this.status, this.message, this.error, this.success});
}

@JsonSerializable(explicitToJson: true)
class SubscribeReq {
  String user;
  SubscribeReq({required this.user});

  /// Connect the generated [_$SubscribeReqFromJson] function to the `fromJson`
  /// factory.
  factory SubscribeReq.fromJson(Map<String, dynamic> json) =>
      _$SubscribeReqFromJson(json);

  /// Connect the generated [_$SubscribeReqToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SubscribeReqToJson(this);
}

Future<SubscribeRes> subscribe(String mektabaId, String userId) async {
  try {
    final response = await http.put(Uri.parse("$mektabaUrl/$mektabaId/members"),
        // headers: getAuthHeaders(token)
        headers: getHeaders(),
        body: jsonEncode(<String, String>{
          'user': userId,
        }));
    final parsed = json.decode(response.body);
    print(parsed);
    if (response.statusCode == 200) {
      return SubscribeRes(status: parsed['status'], message: parsed["message"]);
    } else {
      return SubscribeRes(error: parsed["error"], message: parsed['message']);
    }
  } catch (e) {
    if (kDebugMode) {
      print("Error in subscription for membership : $e ");
    }
    throw Exception("Failed to subscribe user");
  }
}

Future cancelMembershipRequest(String mektabaId, String userId) async {
  try {
    final response =
        await http.put(Uri.parse("$mektabaUrl/$mektabaId/members/cancel"),
            // headers: getAuthHeaders(token)
            headers: getHeaders(),
            body: jsonEncode(<String, String>{
              'user': userId,
            }));
    final parsed = json.decode(response.body);
    if (response.statusCode == 200) {
      return SubscribeRes(
        success: parsed["success"],
        message: "Demande d'adhésion",
        status: null,
      );
    } else {
      return SubscribeRes(error: parsed["error"]);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    throw Exception("Failed to cancel membership request");
  }
}
