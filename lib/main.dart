import 'package:color_picker/color_main_tab.dart';
import 'package:flutter/material.dart';

import 'color_library_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorLibraryTab(),
      //home: ColorMainTab(),
    );
  }
}
