import 'package:audioplayers/audioplayers.dart';
import 'package:dictionary/components/dictionary.dart';
import 'package:dictionary/dictionary/viewmodels/dictionary_view_model.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:dictionary/utils/navigations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RandomCard extends StatefulWidget {
  const RandomCard({super.key});

  @override
  State<RandomCard> createState() => _RandomCardState();
}

class _RandomCardState extends State<RandomCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DictionaryViewModel>(
        builder: (context, dictionaryModel, child) {
      if (dictionaryModel.loading) {
        return Center(
          child: CupertinoActivityIndicator(),
        );
      }
      if (dictionaryModel.RandomWordsynonym.isEmpty) {
        return Center(
          child: Text('No data'),
        );
      }
      return Container(
        padding: EdgeInsets.all(10),
        height: 270,
        width: 350,
        decoration: BoxDecoration(
            color: Color.fromARGB(
              255,
              4,
              2,
              78,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(4, -7),
                  blurRadius: 15,
                  spreadRadius: 1),
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.4,
                  1
                ],
                colors: [
                  Color.fromARGB(255, 13, 11, 94),
                  const Color.fromARGB(255, 40, 39, 39),
                ])),
        child: Column(
          children: [
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dictionaryModel.ranndomword,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      InkWell(
                        onTap: () async {
                          if (dictionaryModel.searchword != null) {
                            print(
                                'https://api.dictionaryapi.dev/media/pronunciations/en/${dictionaryModel.ranndomword!}-uk.mp3');
                            final player = AudioPlayer();
                            await player.setReleaseMode(ReleaseMode.stop);
                            await player.play(UrlSource(
                                'https://api.dictionaryapi.dev/media/pronunciations/en/${dictionaryModel.ranndomword!}-uk.mp3')); // Play audio from URL
                          } else {
                            print('No audio URL provided');
                          }
                          ;
                        },
                        child: DictionaryBox(
                          size: 20,
                          icon: Icons.volume_up_rounded,
                          height: 40,
                          width: 40,
                          url: dictionaryModel.ranndomword,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                          text: 'Phonetic       ',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: color1),
                          children: [
                            TextSpan(
                              text:
                                  '[${dictionaryModel.RandomWordsynonym[0].phonetic}]',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      dictionaryModel.RandomWordsynonym[0].meanings[0]
                          .definitions[0].definition!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 210, 209, 209)),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                dictionaryModel.setword(dictionaryModel.ranndomword);
                opensearchpage(context);
              },
              child: Text(
                'show more..',
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: color1),
              ),
            )
          ],
        ),
      );
    });
  }
}
