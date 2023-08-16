import 'package:http/http.dart'  as http;
import 'package:test/models/book_copy.dart';
import 'dart:convert';

class RemoteService {
  Future getBooks() async {
    print("i am at the top of the function");
    var client = http.Client();
    var uri = Uri.parse('https://mektaba.imadelmahrad.com/api/mektaba/books');
    print('my uri $uri');
    var response = await client.get(uri);
    print('my response $response');
    if(response.statusCode == 200) {
      var json = response.body;
      print(" json: ");
      // return booksFromJson(json);
    }
  }



}