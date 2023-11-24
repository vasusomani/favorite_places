import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../place_model.dart';

class PlaceNotifier extends StateNotifier<List<Place>> {
  PlaceNotifier() : super([]);

  void addPlace(Place newPlace) {
    state = [newPlace, ...state];
  }

  Place deletePlace(String placeID) {
    Place tempPlace = state.firstWhere((element) => element.placeID == placeID);
    state.removeWhere((element) => element.placeID == placeID);
    return tempPlace;
  }
}

final placesListProvider =
    StateNotifierProvider<PlaceNotifier, List<Place>>((ref) => PlaceNotifier());
