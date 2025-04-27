import 'package:dictionary/components/dictionary.dart';
import 'package:dictionary/components/search_word.dart';
import 'package:dictionary/dictionary/viewmodels/dictionary_view_model.dart';
import 'package:dictionary/utils/navigations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DictionaryViewModel().getRandomWord();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Container(
                    height: 250,
                    width: 250,
                    child: LottieBuilder.asset(
                        'assets/Animation - 1725604992016.json')),
                Text(
                  'Thesaurus',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Find some synonyms, antonyms ,and\n                     related words',
                  style: TextStyle(color: Colors.grey[600], fontSize: 15),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                    onTap: () => opensearchpage(context), child: SearchBox()),
                Spacer(),
                InkWell(
                    onTap: () => openrandommeaning(context),
                    child: DictionaryBox(
                      height: 60,
                      width: 60,
                      size: 30,
                      icon: Icons.book,
                    )),
                Spacer()
              ],
            ),
          ),
        ));
  }
}
