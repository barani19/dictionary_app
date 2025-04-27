import 'package:dictionary/dictionary/viewmodels/dictionary_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DictionaryViewModel>(
        builder: (context, dictionaryModel, child) {
          if (dictionaryModel.loading) {
            return Center(
              child: CupertinoActivityIndicator(
                radius: 30,
              ),
            );
          }

          return Column(
            children: [
              // Random Word Section
              Container(
                height: 200,
                width: 200,
                child: // Guard against empty random word synonym list
                    Column(
                  children: [
                    Text(dictionaryModel.ranndomword),
                    (dictionaryModel.RandomWordsynonym.isEmpty ||
                            dictionaryModel
                                .RandomWordsynonym[0].meanings.isEmpty ||
                            dictionaryModel.RandomWordsynonym[0].meanings[0]
                                .synonyms.isEmpty)
                        ? Center(
                            child:
                                Text("No synonyms available for random word"),
                          )
                        : // Fixed typo
                        Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) => Container(
                                child: Text(dictionaryModel.RandomWordsynonym[0]
                                    .meanings[0].synonyms[index]
                                    .toString()),
                              ),
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: dictionaryModel.RandomWordsynonym[0]
                                  .meanings[0].synonyms.length,
                            ),
                          ),
                  ],
                ),
              ),

              // User Searched Word Section
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    // Guard against empty synonym list
                    if (dictionaryModel.synonym.isEmpty ||
                        dictionaryModel.synonym[0].meanings.isEmpty ||
                        dictionaryModel
                            .synonym[0].meanings[0].synonyms.isEmpty) {
                      return Center(child: Text("No synonyms available"));
                    }
                    return Container(
                      child: Text(dictionaryModel
                          .synonym[0].meanings[0].synonyms[index]
                          .toString()),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: dictionaryModel.synonym.isNotEmpty &&
                          dictionaryModel.synonym[0].meanings.isNotEmpty
                      ? dictionaryModel.synonym[0].meanings[0].synonyms.length
                      : 0,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
