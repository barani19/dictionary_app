import 'dart:io';

import 'package:dictionary/dictionary/models/dictionary_model.dart';
import 'package:dictionary/dictionary/repo/api_status.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:http/http.dart' as http;

class DictionaryRepo{
  Future<Object> dictionaryData(String word)async{
    try{
      var url = Uri.parse(api_url+word);
      var res = await http.get(url);
      if(res.statusCode == SUCCESS){
          return Success(code: SUCCESS, response: DictionaryModelFromJson(res.body));
      }
      return Failure(code: INVALID_RESPONSE, errormessage: 'invalid response');
    }on HttpException{
      return Failure(code: NO_INTERNET, errormessage: 'no internet');
    }
    on FormatException{
      return Failure(code: INVALID_FORMAT, errormessage: 'invalid format');
    }catch(e){
       return Failure(code: UNKNOWN_ERROR, errormessage: 'unknown error');
    }

  }
}