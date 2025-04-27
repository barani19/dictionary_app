import 'dart:convert';
import 'package:dictionary/utils/constants.dart';
import 'package:http/http.dart' as http;

class RandomWord{
   final String apiUrl = 'https://random-word-api.herokuapp.com/word';

  Future<String> getRandomWord() async{
    try{
       final res = await http.get(Uri.parse(apiUrl));
       if(res.statusCode == SUCCESS){
          List<dynamic> wordlist =  json.decode(res.body);
          return wordlist[0];
       }
       else{
        return 'cant able to fetch';
       }
    }
    catch(e){
      throw Exception(e);
    }
  }
}