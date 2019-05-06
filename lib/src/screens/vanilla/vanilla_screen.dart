import 'package:flutter/material.dart';

import 'package:flutter_architecture/src/api_service.dart';
import 'package:flutter_architecture/strings.dart';
import 'package:flutter_architecture/src/model/dog.dart';

class VanillaScreen extends StatefulWidget {
  VanillaScreen(this._apiService);

  final ApiService _apiService;

  @override
  _VanillaScreenState createState() => _VanillaScreenState();
}

class _VanillaScreenState extends State<VanillaScreen> {
  bool _loading = true;
  List<Dog> _dogs;

  @override
  void initState() {
    widget._apiService.getDogs(100).then((dogs) {
      setState(() {
        _loading = false;
        _dogs = dogs;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.vanillaName),
        centerTitle: true,
      ),
      body: _loading ? _buildLoading() : _buildBody(),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildBody() {
    if (_dogs != null) {
      return GridView.count(
        crossAxisCount: 4,
        children: _dogs.map((dog) => Image.network(dog.photoUrl)).toList(),
      );
    } else {
      return Center(
        child: Text(
          Strings.errorMessage,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
      );
    }
  }
}
