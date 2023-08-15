import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/models/book.dart';


class ApiService {

  String baseUrl = "https://mektaba.imadelmahrad.com/api/mektaba";
  String stocks = "stocks";
  String books = "books";

  String prepareQuery(String fetchedData) {
    return "$baseUrl/$fetchedData";
  }



Future<List<Book>> fetchBooks() async {
  try {
    print("clicked");
    final response = await http.get(Uri.parse("https://mektaba.imadelmahrad.com/api/mektaba/books"));
    if (response.statusCode == 200) {
      print(response.body);
      print("response status code = 200");
      final  decodedData = json.decode(response.body);
      final  books = (decodedData["books"] as List).map((item) => Book.fromJson(item)).toList();
      print(' all books $books');
      return books;
    } else {
      print("error");
      throw Exception('Failed during loading books');
    }
  } catch (e) {
    print(" error error");
    throw Exception('Error during http.get: $e');
  }
}

}


