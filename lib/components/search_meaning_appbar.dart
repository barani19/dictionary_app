import 'package:dictionary/components/dictionary.dart';
import 'package:dictionary/dictionary/viewmodels/dictionary_view_model.dart';
import 'package:dictionary/utils/navigations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Consumer<DictionaryViewModel>(
      builder: (context, dictionaryModel, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: SizedBox(
          height: 70,
          width: double.infinity,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  closerandommeaning(
                      context); // Ensure this function is defined
                },
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 20,
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Search by word',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: InkWell(
                      onTap: () {
                        dictionaryModel.setword(controller.text.trim());
                        dictionaryModel.getMeaning(); // Fetch meaning
                      },
                      child: DictionaryBox(
                        icon: Icons.send,
                        height: 30,
                        width: 30,
                        size: 20,
                        word: controller.text.trim(),
                        
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
