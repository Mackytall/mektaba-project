import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:test/pages/books/add_book/add_book_form.dart';
import 'package:test/pages/books/add_book/add_book_from_isbn.dart';
import 'package:test/pages/books/add_book/scan_book.dart';
import 'package:test/pages/mektaba/mektaba_main_screen.dart';
import 'package:test/widget/app_bar_builder.dart';
import 'package:test/widget/textField.dart';

class AddBook extends StatefulWidget {
  const AddBook({
    Key? key,
  }) : super(key: key);
  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  Future<void> _dialogBuilder(
      BuildContext context,
      MobileScannerController cameraController,
      TextEditingController isbnController) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          title: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              color: Colors.black,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.cancel),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "ISBN",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ))
                ],
              )),
          content: Form(
            child: TextFormField(
              controller: isbnController,
              decoration: InputDecoration(
                  hintText: "Scannez ou renseignez l'ISBN",
                  border: OutlineInputBorder()),
            ),
          ),
          actions: <Widget>[
            TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Scanner'),
                onPressed: () => _navigateToScanBookPage(
                    context, cameraController, isbnController)),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Valider'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBookFromIsbn()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _navigateToScanBookPage(
      BuildContext context,
      MobileScannerController cameraController,
      TextEditingController isbnController) async {
    String? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScanBook(
          cameraController: cameraController,
        ),
      ),
    );

    if (result != null) {
      isbnController.text = result;
      return _dialogBuilder(context, cameraController, isbnController);
    }
  }

  late TextEditingController isbnController;
  MobileScannerController cameraController = MobileScannerController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isbnController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    isbnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBuilder(),
        body: Center(
          child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Text(
                          "Ajouter un ouvrage",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Ajout d'un ouvrage via ISBN"),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _dialogBuilder(
                        context, cameraController, isbnController),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    child: const Text('Avec ISBN'),
                  ),
                ],
              )),
        ));
  }
}
