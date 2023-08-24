import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/models/book.dart';
import 'package:test/models/stock.dart';

class ApiService {
  String baseUrl = "https://mektaba.imadelmahrad.com/api/mektaba";
  String stocks = "stocks";
  String books = "books";
  String stocksWithPopulate = "stocks/populate";
  String mektabas = "mektabas";

  String prepareQuery(String fetchedData) {
    return "$baseUrl/$fetchedData";
  }

  apiCall(data, ModelFromJson) async {
    var decodedDataIndex;
    if (data == stocksWithPopulate) {
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
        throw Exception('Failed during loading books');
      }
    } catch (e) {
      print(" print : Error during http.get: $e");
      throw Exception('Error during http.get: $e');
    }
  }
}
