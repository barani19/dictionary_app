import 'package:dictionary/dictionary/models/dictionary_model.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';

class MeaningsCard extends StatelessWidget {
  final String? partofspeech;
  final List<Definition>? definitions;

  const MeaningsCard({super.key, required this.partofspeech, this.definitions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                partofspeech!.toUpperCase() ?? 'Unknown',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: color1),
              ),
            ),
            if (definitions != null && definitions!.isNotEmpty)
              // Use SizedBox or ConstrainedBox to define the height of the list
              ListView.builder(
                shrinkWrap:
                    true, // Prevents ListView from taking infinite space
                physics:
                    NeverScrollableScrollPhysics(), // Prevents scrolling if not needed
                itemCount: definitions!.length,
                itemBuilder: (context, index) {
                  String? mean = definitions![index].definition;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Text(
                      '${index + 1}. $mean',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  );
                },
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
