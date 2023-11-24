import 'package:flutter/material.dart';

import 'add_place_page.dart';
import '../util/places_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        centerTitle: false,
        titleTextStyle: Theme.of(context).textTheme.headline6,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPlacePage(),
              ),
            ),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: const Padding(padding: EdgeInsets.all(10), child: PlacesList()),
    );
  }
}
