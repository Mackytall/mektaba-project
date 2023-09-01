import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/models/book.dart';
import 'package:test/models/stock.dart';
import 'package:test/models/user.dart';

class ApiService {
  String baseUrl = "https://mektaba.imadelmahrad.com/api/mektaba";
  String apiUrl = "https://mektaba.imadelmahrad.com/api";
  String stocks = "stocks";
  String books = "books";
  String stocksWithPopulate = "stocks/populate";
  String mektabas = "mektabas";
  String users = "users";

  String prepareQuery(String fetchedData) {
    return "$baseUrl/$fetchedData";
  }

  apiCall(data, ModelFromJson) async {
    var decodedDataIndex;
    var url;
    if (data == stocksWithPopulate) {
      decodedDataIndex = stocks;
    } else {
      decodedDataIndex = data;
    }
    if (data == users) {
      url = apiUrl;
    } else {
      url = baseUrl;
    }
    try {
      // print('in try catch block');
      final response = await http.get(Uri.parse("$url/$data"));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        // print(decodedData);
        final result = (decodedData[decodedDataIndex] as List)
            .map((item) => ModelFromJson(item))
            .toList();
        return result;
      } else {
        throw Exception('Failed during loading ressource');
      }
    } catch (e) {
      print(" print : Error during http.get: $e");
      throw Exception('Error during http.get: $e');
    }
  }

  Future sendData(endpoint, data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
      //
    );

    if (response.statusCode == 201) {
      print("ressource created !");
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create ressource.');
    }
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
        throw Exception(
            'Failed during loading resource: ${response.statusCode}');
      }
    } catch (e) {
      print("Error during http.get: $e");
      throw Exception('Error during http.get: $e');
    }
  }
}
