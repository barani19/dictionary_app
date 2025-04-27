import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';

class SynonymsCard extends StatelessWidget {
  final List<String>? synonyms;

  const SynonymsCard({super.key, this.synonyms});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'SYNONYMS',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: color1),
              ),
            ),
            if (synonyms != null && synonyms!.isNotEmpty)
              // Use SizedBox or ConstrainedBox to define the height of the list
              Expanded(
                child: ListView.builder(
                  shrinkWrap:
                      true, // Prevents ListView from taking infinite space
                  // Prevents scrolling if not needed
                  itemCount: synonyms!.length,

                  itemBuilder: (context, index) {
                    print(synonyms!.length);
                    String? mean = synonyms![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Text(
                        '${index + 1}. $mean',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('No definitions available.'),
              ),
          ],
        ),
      ),
    );
  }
}
