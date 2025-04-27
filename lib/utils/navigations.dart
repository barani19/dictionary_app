import 'package:dictionary/dictionary/views/randomword_page.dart';
import 'package:dictionary/dictionary/views/search_page.dart';
import 'package:flutter/material.dart';

void openrandommeaning(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => RandomwordPage()));
}

void closerandommeaning(BuildContext context){
  Navigator.pop(context);
}

void opensearchpage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage()));
}