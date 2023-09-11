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
  String stocksWithBookDetail = "stocks/book/detail";
  String mektabas = "mektabas";
  String users = "users";
  String createUserEndpoint = "users/signup";

  String prepareQuery(String fetchedData) {
    return "$baseUrl/$fetchedData";
  }

  apiCall(data, ModelFromJson) async {
    var decodedDataIndex;
    var url;
    if (data == stocksWithBookDetail) {
      decodedDataIndex = stocks;
    } else {
      decodedDataIndex = data;
    }

    try {
      // print('in try catch block');
      final response = await http.get(Uri.parse("$baseUrl/$data"));
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
    var url;
    if (endpoint == createUserEndpoint) {
      url = apiUrl;
    } else {
      url = baseUrl;
    }
    try {
      final response = await http.post(
        Uri.parse('$url/$endpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
        //
      );

      if (response.statusCode == 201) {
        print("ressource created !");
        return true;
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception('Failed to create ressource.');
      }
    } catch (e) {
      return e;
    }
  }
}
