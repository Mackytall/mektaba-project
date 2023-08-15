import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:test/pages/mektaba_owner/add_book/scan_book.dart';
import 'package:test/widget/app_bar_builder.dart';
import 'package:test/widget/textField.dart';

class AddBook extends StatefulWidget {
  final String? scannedIsbn;

  const AddBook({Key? key,  this.scannedIsbn}) : super(key: key);
  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {

Future<void> _dialogBuilder(
    BuildContext context, cameraController,scannedIsbn) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Avec ISBN'),
        content: Form(
            child: Column(
          children: [
            TextFormField(
              controller: TextEditingController(text: scannedIsbn),
              
            ),
          ],
        )),
        actions: <Widget>[
          TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Scanner'),
              onPressed: () => _navigateToScanBookPage(context, cameraController)
              // Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => ScanBook(
              //               cameraController: cameraController,
              //               scannedIsbn: scannedIsbn,
              //               )),
              //     )
                  ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Valider'),
            onPressed: () {},
          ),
        ],
      );
    },
  );
}


Future<void> _navigateToScanBookPage(BuildContext context, cameraController) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScanBook(cameraController: cameraController,),
      ),
    );

    // 'result' will be the data returned from ScanBookPage
    if (result != null) {
      isbnController.text = result;
      // Do something with the result (e.g., update a TextField)
      print('Returned ISBN: $result');
      // Now you can use the 'result' (scanned ISBN) to update your TextField or perform other actions.
    }
  }

  late TextEditingController isbnController;
  final _formKey = GlobalKey<FormState>();
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
                    onPressed: () => 
                        _dialogBuilder(context, cameraController, widget.scannedIsbn),
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




