import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:test/utils/requests.dart';

part 'membership.g.dart';

enum MembershipStatus { pending, approve, refused }

@JsonSerializable(explicitToJson: true)
class Membership {
  @JsonKey(name: '_id')
  String id;
  String user;
  String mektaba;
  String? status;
  String? requestDate;
  String createdAt;
  String updatedAt;

  Membership({
    required this.id,
    required this.user,
    required this.mektaba,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Connect the generated [_$MembershipFromJson] function to the `fromJson`
  /// factory.
  factory Membership.fromJson(Map<String, dynamic> json) =>
      _$MembershipFromJson(json);

  /// Connect the generated [_$MembershipToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MembershipToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Subscribe {
  @JsonKey(name: '_id')
  String user;
  String mektaba;

  Subscribe({
    required this.user,
    required this.mektaba,
  });

  /// Connect the generated [_$SubscribeFromJson] function to the `fromJson`
  /// factory.
  factory Subscribe.fromJson(Map<String, dynamic> json) =>
      _$SubscribeFromJson(json);

  /// Connect the generated [_$SubscribeToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SubscribeToJson(this);
}

class MembershipResponse {
  String? status;
  String? errorMessage;

  MembershipResponse({this.status, this.errorMessage});
}

const membershipApi = 'https://mektaba.imadelmahrad.com/api/mektaba/membership';
Future<MembershipResponse> subscribe(Subscribe data) async {
  try {
    final response = await http.post(
      Uri.parse(membershipApi),
      headers: getHeaders(),
      body: jsonEncode(data.toJson()),
    );
    final parsed = json.decode(response.body);
    if (response.statusCode == 201) {
      final status = parsed['status'];
      return MembershipResponse(status: status);
    }
    final String message = parsed["error"];
    return MembershipResponse(errorMessage: message);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return MembershipResponse(
        errorMessage: "Un problème est survenu, veuillez réessayer");
  }
}
