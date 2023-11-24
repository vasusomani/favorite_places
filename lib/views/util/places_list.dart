import 'package:favorite_places/model/providers/place_provider.dart';
import 'package:favorite_places/views/pages/place_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/place_model.dart';

class PlacesList extends ConsumerWidget {
  const PlacesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Place> placesList = ref.watch(placesListProvider);
    return placesList.isEmpty
        ? Center(
            child: Text(
              "No places added yet",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PlaceDetailPage(focusedPlace: placesList[index]))),
                title: Text(placesList[index].title),
                titleTextStyle: Theme.of(context).textTheme.titleMedium,
                leading: CircleAvatar(
                    backgroundImage: FileImage(placesList[index].image)),
              );
            },
            itemCount: placesList.length,
            itemExtent: 50,
          );
  }
}
