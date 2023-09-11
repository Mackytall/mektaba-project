import 'package:flutter/foundation.dart';
import 'package:test/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/utils/requests.dart';

part 'auth.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthUser {
  String id;
  String token;

  AuthUser({
    required this.id,
    required this.token,
  });

  /// Connect the generated [_$AuthUserFromJson] function to the `fromJson`
  /// factory.
  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);

  /// Connect the generated [_$AuthUserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AuthUserToJson(this);
}

class AuthentifiedUser {
  User? user;
  String? token;
  String? errorMessage;

  AuthentifiedUser({
    this.user,
    this.token,
    this.errorMessage,
  });
}

Future<AuthentifiedUser> signUp(CreateUser user) async {
  try {
    final response = await http.post(
      Uri.parse('$usersApi/signup'),
      headers: getHeaders(),
      body: jsonEncode(user.toJson()),
    );
    final parsed = json.decode(response.body);
    if (response.statusCode == 201) {
      final authUser = AuthUser(id: parsed["id"], token: parsed["token"]);
      final user = await getUser(authUser.id, authUser.token);
      return AuthentifiedUser(user: user!, token: parsed["token"]);
    }
    final String? errorMessage = parsed["error"];
    return AuthentifiedUser(errorMessage: errorMessage);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return AuthentifiedUser(
        errorMessage: "Un problème est survenu, veuillez réessayer");
  }
}

Future<AuthentifiedUser> login(LogUser user) async {
  try {
    final response = await http.post(
      Uri.parse("$usersApi/login"),
      headers: getHeaders(),
      body: jsonEncode(user.toJson()),
    );
    final parsed = json.decode(response.body);
    if (response.statusCode == 200) {
      final authUser = AuthUser(id: parsed['id'], token: parsed['token']);
      final user = await getUser(authUser.id, authUser.token);
      return AuthentifiedUser(user: user, token: parsed['token']);
    }
    final String message = parsed["error"];
    return AuthentifiedUser(errorMessage: message);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return AuthentifiedUser(
        errorMessage: "Un problème est survenu, veuillez réessayer");
  }
}
