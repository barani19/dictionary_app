import 'package:dictionary/components/meanings.dart';
import 'package:dictionary/dictionary/models/dictionary_model.dart';
import 'package:dictionary/dictionary/viewmodels/dictionary_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeaningsBuilder extends StatefulWidget {
  const MeaningsBuilder({super.key});

  @override
  State<MeaningsBuilder> createState() => _MeaningsBuilderState();
}

class _MeaningsBuilderState extends State<MeaningsBuilder> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DictionaryViewModel>(
      builder: (context, dictionaryModel, child) {
        // Check if synonym list is not null and has elements
        if (dictionaryModel.synonym != null &&
            dictionaryModel.synonym.isNotEmpty) {
          // Check if synonym[0] is not null and has meanings
          var synonym = dictionaryModel.synonym[0];
          if (synonym.meanings != null && synonym.meanings.isNotEmpty) {
            return SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: synonym.meanings.length,
                shrinkWrap:
                    true, // Prevents ListView from taking infinite height
                itemBuilder: (context, index) {
                  print(synonym.meanings.length);
                  String? pos =
                      synonym.meanings[index].partOfSpeech ?? "Unknown";
                  List<Definition>? definition =
                      synonym.meanings[index].definitions;
                  print(pos);
                  return MeaningsCard(
                    partofspeech: pos,
                    definitions: definition,
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text('No meanings available.'),
            );
          }
        } else {
          return const Center(
            child: Text('No synonyms found.'),
          );
        }
      },
    );
  }
}
