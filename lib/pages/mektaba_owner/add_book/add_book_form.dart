import 'dart:io';
import 'package:flutter/material.dart';
import 'package:test/widget/textField.dart';
import '../../../utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class AddBookForm extends StatefulWidget {
  const AddBookForm({Key? key}) : super(key: key);

  @override
  State<AddBookForm> createState() => _AddBookForm();
}

class _AddBookForm extends State<AddBookForm> {
  // Book newBook = Book();
  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Ajouter une image'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.image),
                        Text('Depuis la gallerie'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.camera),
                        Text("Depuis l'appreil photo"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  final _formKey = GlobalKey<FormState>();

  late TextEditingController title;
  // late TextEditingController category;
  late TextEditingController isbn;
  late TextEditingController author;
  late TextEditingController ean13;
  late TextEditingController publisher;
  late TextEditingController year;
  late TextEditingController language;
  late TextEditingController pageNumber;
  late TextEditingController description;
  bool onlyAvailableOnSite = false;
  List<DropdownMenuItem<String>> categories = [
    DropdownMenuItem(child: Text("Politique"), value: "Politique"),
    DropdownMenuItem(child: Text("Histoire"), value: "Histoire"),
    DropdownMenuItem(child: Text("Spiritualité"), value: "Spiritualité"),
    DropdownMenuItem(child: Text("Enfant"), value: "Enfant"),
  ];
  List<DropdownMenuItem<String>> languages = [
    DropdownMenuItem(child: Text("Français"), value: "Francais"),
    DropdownMenuItem(child: Text("Anglais"), value: "Anglais"),
    DropdownMenuItem(child: Text("Arabe"), value: "Arabe"),
  ];
  String? selectedCategory;
  String? selectedLanguage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = TextEditingController();
    // category = TextEditingController();
    isbn = TextEditingController();
    author = TextEditingController();
    ean13 = TextEditingController();
    publisher = TextEditingController();
    year = TextEditingController();
    language = TextEditingController();
    pageNumber = TextEditingController();
    description = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    title.dispose();
    isbn.dispose();
    author.dispose();
    ean13.dispose();
    publisher.dispose();
    year.dispose();
    language.dispose();
    pageNumber.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Container(
          // padding: const EdgeInsets.all(15),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                image != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            //to show image, you type like this.
                            File(image!.path),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 4,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image(
                            image: const AssetImage(
                                "assets/illustrations/book_default.png"),
                            height: MediaQuery.of(context).size.height / 4,
                          ),
                        ),
                      ),
                ElevatedButton(
                  onPressed: () {
                    myAlert();
                  },
                  child: Text('Ajouter une image'),
                ),
                // Form(
                //     key: _formKey,
                //     child: Column(
                //       children: [
                //         SetTextField(controller: isbn, labelText: "ISBN", onSaved: (value) => newBook.isbn = value,),
                //         SetTextField(controller: title, labelText: "Titre",onSaved: ( value) => newBook.title = value,),
                //         DropdownButtonFormField(
                //           padding: const EdgeInsets.symmetric(
                //               vertical: 8, horizontal: 16),
                //           style: const TextStyle(
                //             fontSize: 12,
                //           ),
                //           decoration: const InputDecoration(
                //             contentPadding: EdgeInsets.symmetric(
                //                 vertical: 8, horizontal: 16),
                //             label: Text("Catégorie",
                //                 style: TextStyle(fontSize: 12)),
                //             border: OutlineInputBorder(),
                //           ),
                //           value: selectedCategory,
                //           items: categories,
                //           onChanged: (String? newValue) {
                //             setState(() {
                //               selectedCategory = newValue!;
                //             });
                //           },
                //           onSaved: (value) => newBook.category = value,
                //         ),
                //         SetTextField(controller: author, labelText: "Auteur", onSaved: (value) => newBook.author = value,),
                //         Row(
                //           children: [
                //             SizedBox(
                //               width: MediaQuery.of(context).size.width / 1.7,
                //               child: SetTextField(
                //                   controller: publisher, labelText: "Editions", onSaved: (value) => newBook.publisher = value,),
                //             ),
                //             SizedBox(
                //               width: MediaQuery.of(context).size.width / 2.5,
                //               child: SetTextField(
                //                   controller: year, labelText: "Année",
                //                   onSaved: (value) {
                //                     if(value != null) {
                //                       newBook.year = int.parse(value);
                //                     }
                //                   } ),
                //             ),
                //           ],
                //         ),
                //         SetTextField(controller: ean13, labelText: "EAN13",onSaved: (value) => newBook.ean13 = value,),
                //         Row(
                //           children: [
                //             SizedBox(
                //               width: MediaQuery.of(context).size.width / 1.7,
                //               child: DropdownButtonFormField(
                //                 padding: const EdgeInsets.symmetric(
                //                     vertical: 8, horizontal: 16),
                //                 style: const TextStyle(
                //                   fontSize: 12,
                //                 ),
                //                 decoration: const InputDecoration(
                //                   contentPadding: EdgeInsets.symmetric(
                //                       vertical: 8, horizontal: 16),
                //                   label: Text("Langue",
                //                       style: TextStyle(fontSize: 12)),
                //                   border: OutlineInputBorder(),
                //                 ),
                //                 value: selectedLanguage,
                //                 items: languages,
                //                 onChanged: (String? newValue) {
                //                   setState(() {
                //                     selectedLanguage = newValue!;
                //                   });
                //                 },
                //                 onSaved: (value) => newBook.language = value,
                //               ),
                //             ),
                //             SizedBox(
                //               width: MediaQuery.of(context).size.width / 2.5,
                //               child: SetTextField(
                //                   controller: pageNumber, labelText: "Pages",
                //                   onSaved: (value) {
                //                     if (value != null) {
                //                       newBook.pageNumber = int.parse(value);
                //                     }
                //                   }),
                //             ),
                //           ],
                //         ),

                //         SetTextField(
                //             controller: description,
                //             hintText: "Description",
                //             maxLines: 6,
                //             onSaved: (value) => newBook.description = value,),

                //         Container(
                //             margin: const EdgeInsets.all(16),
                //             child: ElevatedButton(
                //               onPressed: () {
                //                 if (_formKey.currentState!.validate()) {
                //                   _formKey.currentState!.save();
                //                   print(newBook.title);
                //                   // Navigator.push(
                //                   //     context,
                //                   //     MaterialPageRoute(
                //                   //         builder: (context) =>
                //                   //             Result(model: this.model))
                //                   //             )
                //                 }
                //               },
                //               child: Text('ENREGISTRER'),
                //             ))
                //       ],
                //     ))
              ]),
        )),
      ),
    );
  }
}
