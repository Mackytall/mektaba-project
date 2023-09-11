import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:test/utils/requests.dart';
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
  String? phone;
  String? address;
  String? zipCode;
  String? city;
  String? country;
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
    this.phone,
    this.address,
    this.zipCode,
    this.city,
    this.country,
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

@JsonSerializable(explicitToJson: true)
class CreateUser {
  String lastName;
  String firstName;
  String email;
  String? photo;
  String phone;
  String address;
  String zipCode;
  String city;
  String country;
  String password;

  CreateUser({
    required this.lastName,
    required this.firstName,
    required this.email,
    this.photo,
    required this.phone,
    required this.address,
    required this.zipCode,
    required this.city,
    required this.country,
    required this.password,
  });

  /// Connect the generated [_$CreateUserFromJson] function to the `fromJson`
  /// factory.
  factory CreateUser.fromJson(Map<String, dynamic> json) =>
      _$CreateUserFromJson(json);

  /// Connect the generated [_$CreateUserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CreateUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LogUser {
  String email;
  String password;

  LogUser({
    required this.email,
    required this.password,
  });

  /// Connect the generated [_$LogUserFromJson] function to the `fromJson`
  /// factory.
  factory LogUser.fromJson(Map<String, dynamic> json) =>
      _$LogUserFromJson(json);

  /// Connect the generated [_$LogUserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LogUserToJson(this);
}

const usersApi = 'https://mektaba.imadelmahrad.com/api/users';
Future<List<User>> getUsers() async {
  try {
    final response = await http.get(Uri.parse(usersApi));

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

final _userCache = AsyncCache<User?>(const Duration(seconds: 30));

Future<User?> getUser(String id, String token) async {
  return _userCache.fetch(() async {
    try {
      final res = await http.get(
        Uri.parse("$usersApi/$id"),
        headers: getAuthHeaders(token),
      );
      if (res.statusCode == 200) {
        final parsed = json.decode(res.body);
        return User.fromJson(parsed["user"]);
      }
      if (kDebugMode) {
        print(res.body);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception("Failed to load user");
    }
  });
}
