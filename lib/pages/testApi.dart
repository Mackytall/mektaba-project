import 'package:flutter/material.dart';
import 'package:test/models/book_copy.dart';
import 'package:test/pages/services/ApiService.dart';
import 'package:test/pages/services/remote_service.dart';

class TestApi extends StatefulWidget {
  const TestApi({Key? key}) : super(key:key);

  @override
  _TestApiState createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  List<Book>? books;
 var isLoaded = false;

 @override
  void initState() {
    super.initState();
    ApiService().fetchBooks();
    // fetch data from api
    // getData();
  }

  // getData() async {
  //   books = await RemoteService().getBooks();
  //   if (books != null) {
  //     print("okok");
  //     setState(() {
  //       isLoaded = true;
  //     });
  //   } else {
  //     print("no books");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts")
      ),
      body: 
        Visibility(
          // visible: isLoaded,
          child:
      ListView.builder
      (
        itemCount: 10,
        itemBuilder: (context, index) {
        return Container(
          child: Text('Hi'),
        );
      }
      ),
      replacement: CircularProgressIndicator(),)
    );
  }
}