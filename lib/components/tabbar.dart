import 'package:dictionary/components/antonyms_builder.dart';
import 'package:dictionary/components/meanings_builder.dart';
import 'package:dictionary/components/synonym_builder.dart';

import 'package:flutter/material.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        children: [
          TabBar(
            dividerColor: Colors.grey[200],
            tabs: [
              Tab(
                child: Text(
                  'Meanings',
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Synonyms',
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Antonyms',
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Expanded(
            child: TabBarView(children: [
              MeaningsBuilder(),
              SynonymBuilder(),
              AntonymsBuilder()
            ]),
          ),
        ],
      ),
    );
  }
}
