import 'package:flutter/material.dart';

const String api_url = 'https://api.dictionaryapi.dev/api/v2/entries/en/';

const int SUCCESS = 200;
const int INVALID_RESPONSE = 100;
const int NO_INTERNET = 101;
const int INVALID_FORMAT = 101;
const int UNKNOWN_ERROR = 101;

const color1 = Color.fromARGB(255, 247, 127, 118);

final boxdecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Color.fromARGB(255, 247, 127, 118),
    // boxShadow: [
    //   BoxShadow(
    //       color: const Color.fromARGB(255, 240, 151, 151),
    //       offset: Offset(4, 4),
    //       blurRadius: 15,
    //       spreadRadius: 1),
    //   BoxShadow(
    //       color: Colors.grey[200]!,
    //       offset: Offset(-4, -4),
    //       blurRadius: 15,
    //       spreadRadius: 1)
    // ],
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [
          0.1,
          1
        ],
        colors: [
          Color.fromARGB(255, 245, 117, 117),
          Color.fromARGB(255, 245, 53, 53),
        ]));
