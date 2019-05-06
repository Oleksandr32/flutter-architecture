import 'package:flutter/material.dart';

import 'package:flutter_architecture/src/api_service.dart';
import 'package:flutter_architecture/src/screens/vanilla/vanilla_screen.dart';
import 'package:flutter_architecture/src/screens/scoped_model/scoped_model_screen.dart';
import 'package:flutter_architecture/src/screens/bloc/bloc_screen.dart';
import 'package:flutter_architecture/strings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({@required this.apiService});

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildBox(
              title: Strings.vanillaName,
              desc: Strings.vanillaDescription,
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VanillaScreen(apiService)),
                  ),
            ),
            SizedBox(height: 8.0),
            _buildBox(
              title: Strings.scopedModelName,
              desc: Strings.scopedModelDescription,
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScopedModelScreen(apiService)),
                  ),
            ),
            SizedBox(height: 8.0),
            _buildBox(
              title: Strings.blocName,
              desc: Strings.blocDescription,
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BlocScreen(apiService)),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBox({
    @required String title,
    @required String desc,
    @required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.redAccent, Colors.greenAccent]),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ]),
      child: MaterialButton(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              desc,
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
