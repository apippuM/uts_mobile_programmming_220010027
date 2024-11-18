import 'package:flutter/material.dart';
import 'package:uts_mobile_programmming/pages/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(speciesName: '', onUpdate: (String speciesName) {  }, onDelete: (String speciesName) {  },),
    );
  }
}
