import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';

class DictionaryBox extends StatelessWidget {
  final IconData icon;
  final double height;
  final double width;
  final double size;
  final String? word;
  final String? url; // Explicitly typed as String for audio URLs

  const DictionaryBox({
    super.key,
    required this.icon,
    required this.height,
    required this.width,
    required this.size,
    this.url,
    this.word,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: boxdecoration,
      child: Icon(
          icon,
         size: size,
        color: Colors.white,
      ),
    );
  }
}
