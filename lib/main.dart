import 'package:dictionary/dictionary/viewmodels/dictionary_view_model.dart';
import 'package:dictionary/dictionary/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//  flutter run --no-enable-impeller  

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DictionaryViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
