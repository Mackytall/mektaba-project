import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
part 'user.g.dart';

enum UserRole { admin, user, adherent, student }

@JsonSerializable(explicitToJson: true)
class User {
  @JsonKey(name: '_id')
  String id;
  String lastName;
  String firstName;
  String email;
  String? photo;
  UserRole? role;
  String? address;
  String? zipCode;
  String? city;
  String? phone;
  List<String>? likedEvents = [];
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.email,
    this.photo,
    this.role,
    this.address,
    this.zipCode,
    this.city,
    this.phone,
    this.likedEvents,
    this.createdAt,
    this.updatedAt,
  });

  /// Connect the generated [_$UserFromJson] function to the `fromJson`
  /// factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

Future<List<User>> getUsers() async {
  const usersUrl = 'https://mektaba.imadelmahrad.com/api/users';

  try {
    final response = await http.get(Uri.parse(usersUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);

      if (decodedData != null && decodedData["users"] != null) {
        final List<User> result = (decodedData["users"] as List)
            .map((item) => User.fromJson(item))
            .toList();

        return result;
      } else {
        // Si les données sont manquantes ou nulles, retournez une liste vide
        return [];
      }
    } else {
      throw Exception('Failed during loading resource: ${response.statusCode}');
    }
  } catch (e) {
    print("Error during http.get: $e");
    throw Exception('Error during http.get: $e');
  }
}
