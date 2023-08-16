import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/models/book.dart';
import 'package:test/models/stock.dart';


class StocksEndpoint {
  String name = "stocks";
  String modelName = "Stock";
}

class ApiService {

  String baseUrl = "https://mektaba.imadelmahrad.com/api/mektaba";



  String prepareQuery(String fetchedData) {
    return "$baseUrl/$fetchedData";
  }



 apiCall(data) async {
  try {
    print("clicked");
    final response = await http.get(Uri.parse("$baseUrl/${data.name}"));
    if (response.statusCode == 200) {
      print(response.body);
      print("response status code = 200");
      final  decodedData = json.decode(response.body);
      final  result = (decodedData[data] as List).map((item) => Stock.fromJson(item)).toList();
      print(' the result is $result');
      return result;
    } else {
      print("error");
      throw Exception('Failed during loading books');
    }
  } catch (e) {
    print(" print : Error during http.get: $e");
    throw Exception('Error during http.get: $e');
  }
}

}


