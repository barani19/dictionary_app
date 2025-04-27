import 'package:dictionary/dictionary/models/dictionary_model.dart';
import 'package:dictionary/dictionary/models/user_error.dart';
import 'package:dictionary/dictionary/repo/api_status.dart';
import 'package:dictionary/dictionary/repo/dictionary_repo.dart';
import 'package:dictionary/dictionary/repo/word_repo.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class DictionaryViewModel extends ChangeNotifier {
  bool _loading = false;
  List<DictionaryModel> _meaning = [];
  List<DictionaryModel> _randomWordmeaning = [];
  String _word = '';
  UserError _userError = UserError(code: 0, message: '');
  String _randomWord = '';

  bool get loading => _loading;
  List<DictionaryModel> get synonym => _meaning;
  List<DictionaryModel> get RandomWordsynonym => _randomWordmeaning;
  String get searchword => _word;
  UserError get usererror => _userError;
  String get ranndomword => _randomWord;

  DictionaryViewModel() {
    getMeaning();
    getRandomWord();
  }

  setloading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setmeaning(List<DictionaryModel> meaning) {
    _meaning = meaning;
    notifyListeners();
  }

  setrandommeaning(List<DictionaryModel> meaning) {
    _randomWordmeaning = meaning;
    notifyListeners();
  }

  setword(String word) {
    _word = word;
    getMeaning();
    notifyListeners();
  }

  setRandomWord(String word) {
    _randomWord = word;
    notifyListeners();
  }

  setusererror(UserError uerror) {
    _userError = uerror;
    notifyListeners();
  }

  getMeaning() async {
    setloading(true);
    var response = await DictionaryRepo().dictionaryData(_word);
    if (response is Success) {
      setmeaning(response.response as List<DictionaryModel>);
    }
    if (response is Failure) {
      UserError usererror = UserError(
          code: response.code, message: response.errormessage as String);
      setusererror(usererror);
    }
    setloading(false);
  }

  getRandomWord() async {
    setloading(true);
    var word = await RandomWord().getRandomWord();
    setRandomWord(word);
    var response = await DictionaryRepo().dictionaryData(_randomWord);
    if (response is Success) {
      setrandommeaning(response.response as List<DictionaryModel>);
    }
    if (response is Failure) {
      UserError usererror = UserError(
          code: response.code, message: response.errormessage as String);
      setusererror(usererror);
    }
    setloading(false);
  }
}
