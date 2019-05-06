import 'dart:async';

import 'package:flutter_architecture/src/api_service.dart';
import 'package:flutter_architecture/src/model/dog.dart';

class DogBloc {
  DogBloc(this._apiService);

  final ApiService _apiService;

  final _dogStreamController = StreamController<DogState>();

  Stream<DogState> get dogs => _dogStreamController.stream;

  void loadDogs({int count = 100}) {
    _apiService.getDogs(count).then((dogs) {
      return _dogStreamController.sink.add(DogDataState(dogs));
    });
  }

  void dispose() {
    _dogStreamController.close();
  }
}

class DogState {}

class DogLoadingState extends DogState {}

class DogDataState extends DogState {
  DogDataState(this.dogs);

  List<Dog> dogs;
}
