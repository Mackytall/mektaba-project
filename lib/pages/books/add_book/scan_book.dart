import 'dart:typed_data';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';
import 'package:test/pages/books/add_book/add_book.dart';
import 'package:test/pages/books/add_book/isbn_dialog.dart';

class ScanBook extends StatefulWidget {
  MobileScannerController cameraController;
  String? scannedIsbn;

  ScanBook({
    required this.cameraController,
    this.scannedIsbn = "",
  });

  @override
  _ScanBookState createState() => _ScanBookState();
}

class _ScanBookState extends State<ScanBook> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.cameraController = MobileScannerController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        fit: BoxFit.contain,
        controller: widget.cameraController,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          setState(() {
            widget.scannedIsbn = barcodes[0].rawValue;
          });
          Navigator.of(context).pop(widget.scannedIsbn);
        },
      ),
    );
  }
}
