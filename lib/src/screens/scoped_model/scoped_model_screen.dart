import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_architecture/src/screens/scoped_model/dog_model.dart';
import 'package:flutter_architecture/src/api_service.dart';
import 'package:flutter_architecture/strings.dart';

class ScopedModelScreen extends StatefulWidget {
  ScopedModelScreen(this._apiService);

  final ApiService _apiService;

  @override
  _ScopedModelScreenState createState() => _ScopedModelScreenState();
}

class _ScopedModelScreenState extends State<ScopedModelScreen> {
  DogModel _dogModel;

  @override
  void initState() {
    _dogModel = DogModel(widget._apiService);
    _dogModel.loadDogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: _dogModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.scopedModelName),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<DogModel>(
          builder: (context, child, model) {
            if (model.loading) {
              return _buildLoading();
            } else {
              return model.dogs != null ? _buildBody(model) : _buildError();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildBody(DogModel model) {
    return GridView.count(
      crossAxisCount: 4,
      children: model.dogs.map((dog) => Image.network(dog.photoUrl)).toList(),
    );
  }

  Widget _buildError() {
    return Center(
      child: Text(
        Strings.errorMessage,
        style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
