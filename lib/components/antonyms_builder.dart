import 'package:dictionary/components/antonyms.dart';
import 'package:dictionary/components/synonyms.dart';
import 'package:dictionary/dictionary/viewmodels/dictionary_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AntonymsBuilder extends StatelessWidget {
  const AntonymsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DictionaryViewModel>(
      builder: (context, dictionaryModel, child) {
        if (dictionaryModel.synonym != null &&
            dictionaryModel.synonym.isNotEmpty) {
          var synonym = dictionaryModel.synonym[0];
          if (synonym.meanings != null && synonym.meanings.isNotEmpty) {
            return AntonymsCard(
              antonyms: synonym.meanings[0].antonyms,
            );
          } else {
            return const Center(
              child: Text('No antonyms available.'),
            );
          }
        } else {
          return const Center(
            child: Text('No antonyms available.'),
          );
        }
      },
    );
  }
}
