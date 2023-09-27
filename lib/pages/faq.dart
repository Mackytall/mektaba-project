import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/config/sizes.dart';
import 'package:test/models/mektaba.dart';
import 'package:test/widget/app_bar_builder.dart';

class FaqPage extends StatelessWidget {
  FaqPage({
    required this.faq,
  });
  final List<Faq>? faq;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
        appBar: AppBarBuilder(),
        body: Center(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Foire aux questions",
                style:
                    TextStyle(fontSize: Sizes.h2, fontWeight: FontWeight.bold)),
            const Text("Liste des questions les plus souvent posées"),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: faq!.length,
              itemBuilder: (context, index) {
                return Theme(
                  data: theme,
                  child: ExpansionTile(
                    collapsedShape:
                        Border(bottom: BorderSide(color: Colors.grey)),
                    tilePadding: EdgeInsets.zero,
                    trailing: Text(""),
                    leading: Icon(Icons.question_mark),
                    title: Text(
                      faq![index].question,
                      style: TextStyle(fontSize: Sizes.h4),
                    ),
                    children: [Text(faq![index].response)],
                  ),
                );
              },
            )),
          ]),
        )));
  }
}
