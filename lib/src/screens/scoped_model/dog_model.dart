import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_architecture/src/api_service.dart';
import 'package:flutter_architecture/src/model/dog.dart';

class DogModel extends Model {
  DogModel(this._apiService);

  final ApiService _apiService;

  bool loading = false;
  List<Dog> dogs;

  Future<void> loadDogs({int count = 100}) async {
    loading = true;
    notifyListeners();
    dogs = await _apiService.getDogs(count);
    loading = false;
    notifyListeners();
  }

  static DogModel of(BuildContext context) => ScopedModel.of<DogModel>(context);
}
