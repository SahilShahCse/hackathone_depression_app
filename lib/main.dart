import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sagar_project/details_page.dart';
import 'package:sagar_project/questions_page.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new MaterialApp(initialRoute: '/questionPage',
      routes: {
        '/questionPage': (context) => QuestionsPage(), // Define root route
        '/detailsPage': (context) => DetailsPage(),
      },);
  }
}