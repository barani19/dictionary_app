import 'package:audioplayers/audioplayers.dart';
import 'package:dictionary/components/dictionary.dart';
import 'package:dictionary/components/search_meaning_appbar.dart';
import 'package:dictionary/components/tabbar.dart';
import 'package:dictionary/dictionary/viewmodels/dictionary_view_model.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SizedBox(
          height: 800,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyAppBar(),
                SizedBox(height: 10),
                Consumer<DictionaryViewModel>(
                    builder: (context, dictionaryModel, child) {
                  if (dictionaryModel.loading) {
                    return Center(
                      child: CupertinoActivityIndicator(
                        radius: 30,
                      ),
                    );
                  }
                  if (dictionaryModel.synonym.isEmpty) {
                    return Center(
                      child: Text('No results found.'),
                    );
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height - 70,
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    height: 140,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 4, 2, 78),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(4, 4),
                                          blurRadius: 15,
                                          spreadRadius: 1,
                                        ),
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(4, -7),
                                          blurRadius: 15,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.4, 1],
                                        colors: [
                                          Color.fromARGB(255, 13, 11, 94),
                                          const Color.fromARGB(255, 40, 39, 39),
                                        ],
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  dictionaryModel.searchword,
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: ()async{
if (dictionaryModel.searchword != null) {
              print(
                  'https://api.dictionaryapi.dev/media/pronunciations/en/${dictionaryModel.searchword!}-uk.mp3');
              final player = AudioPlayer();
              await player.setReleaseMode(ReleaseMode.stop);
              await player.play(UrlSource(
                  'https://api.dictionaryapi.dev/media/pronunciations/en/${dictionaryModel.searchword!}-uk.mp3')); // Play audio from URL
            } else {
              print('No audio URL provided');
            };
                                                } ,
                                                child: DictionaryBox(
                                                  size: 20,
                                                  icon: Icons.volume_up_rounded,
                                                  height: 40,
                                                  width: 40,
                                                  url: dictionaryModel.searchword,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, bottom: 15),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: RichText(
                                              text: TextSpan(
                                                text: 'Phonetic       ',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: color1,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '[${dictionaryModel.synonym.isNotEmpty ? dictionaryModel.synonym[0].phonetic : ''}]',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                    height: 500,
                                    child:
                                        Tabbar()), // Ensure Tabbar is correctly implemented
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
