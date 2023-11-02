import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:googlesheets_notes/googlesheets_api.dart';

import 'pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSheets().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: ThemeData(fontFamily: "OpenSans"),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
