import 'package:dictionary/components/synonyms.dart';
import 'package:dictionary/dictionary/viewmodels/dictionary_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SynonymBuilder extends StatelessWidget {
  const SynonymBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DictionaryViewModel>(
      builder: (context, dictionaryModel, child) {
        if (dictionaryModel.synonym != null &&
            dictionaryModel.synonym.isNotEmpty) {
          var synonym = dictionaryModel.synonym[0];
          if (synonym.meanings != null && synonym.meanings.isNotEmpty) {
            return SynonymsCard(
              synonyms: synonym.meanings[0].synonyms,
            );
          } else {
            return const Center(
              child: Text('No synonyms available.'),
            );
          }
        } else {
          return const Center(
            child: Text('No synonyms available.'),
          );
        }
      },
    );
  }
}
