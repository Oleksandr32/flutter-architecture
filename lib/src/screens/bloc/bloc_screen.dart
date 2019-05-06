import 'package:flutter/material.dart';

import 'package:flutter_architecture/src/screens/bloc/dog_bloc.dart';
import 'package:flutter_architecture/src/api_service.dart';
import 'package:flutter_architecture/strings.dart';

class BlocScreen extends StatefulWidget {
  BlocScreen(this._apiService);

  final ApiService _apiService;

  @override
  _BlocScreenState createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  DogBloc _dogBloc;

  @override
  void initState() {
    _dogBloc = DogBloc(widget._apiService);
    _dogBloc.loadDogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.blocName),
        centerTitle: true,
      ),
      body: StreamBuilder<DogState>(
        initialData: DogLoadingState(),
        stream: _dogBloc.dogs,
        builder: (context, snapshot) {
          final state = snapshot.data;
          if (state is DogLoadingState) {
            return _buildLoading();
          } else if (state is DogDataState) {
            return state.dogs != null ? _buildBody(state) : _buildError();
          }
        },
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildBody(DogDataState state) {
    return GridView.count(
      crossAxisCount: 4,
      children: state.dogs.map((dog) => Image.network(dog.photoUrl)).toList(),
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
