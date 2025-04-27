import 'dart:ui';
import 'package:dictionary/components/dictionary.dart';
import 'package:dictionary/components/random_card.dart';
import 'package:dictionary/dictionary/viewmodels/dictionary_view_model.dart';
import 'package:dictionary/utils/navigations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RandomwordPage extends StatelessWidget {
  const RandomwordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Stack(
                    children: [
                      Container(
                        height: 250,
                        width: 250,
                        child: LottieBuilder.asset(
                          'assets/Animation - 1725604992016.json',
                        ),
                      ),
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            color: Colors
                                .transparent, // Can adjust transparency to enhance the blur
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Word of the day',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Build your vocabulory with new words and \n         definitions every day of the week',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RandomCard(),
                  Spacer(),
                  InkWell(
                    onTap: () => closerandommeaning(context),
                    child: DictionaryBox(
                      size: 30,
                      height: 60,
                      width: 60,
                      icon: Icons.close,
                      url: DictionaryViewModel().ranndomword,
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
        ));
  }
}
