import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 300,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 242, 241, 241),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[500]!,
                offset: Offset(0, 7),
                blurRadius: 15,
                spreadRadius: 1),
            BoxShadow(
                color: Color.fromARGB(255, 236, 235, 235),
                offset: Offset(-4, -4),
                blurRadius: 15,
                spreadRadius: 1)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: [
                Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 173, 173, 173),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Search by word',
                  style: TextStyle(color: Color.fromARGB(255, 146, 146, 146)),
                ),
              ],
            ),
            Icon(
              Icons.keyboard_voice,
              color: Color.fromARGB(255, 173, 173, 173),
            ),
          ],
        ),
      ),
    );
  }
}
