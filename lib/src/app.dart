import 'package:flutter/material.dart';

import 'package:flutter_architecture/src/api_service.dart';
import 'package:flutter_architecture/src/screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Architecture',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomeScreen(
        apiService: ApiService(),
      ),
    );
  }
}
