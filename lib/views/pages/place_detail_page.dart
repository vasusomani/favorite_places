import 'package:flutter/material.dart';

import '../../model/place_model.dart';

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({Key? key, required this.focusedPlace})
      : super(key: key);
  final Place focusedPlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(focusedPlace.title),
        centerTitle: false,
      ),
      body: Image.file(focusedPlace.image),
    );
  }
}
