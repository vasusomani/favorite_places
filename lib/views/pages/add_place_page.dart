import 'dart:io';
import '../../controllers/new_place_textfield.dart';
import '../../model/place_model.dart';
import '../../model/providers/place_provider.dart';
import '../util/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlacePage extends ConsumerWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  AddPlacePage({Key? key})
      : controller = TextEditingController(),
        formKey = GlobalKey<FormState>(),
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    File? selectedImage;
    void addPlace() {
      if (formKey.currentState!.validate() && selectedImage != null) {
        ref.read(placesListProvider.notifier).addPlace(Place(
            placeID: DateTime.now().toString(),
            title: controller.text.toString(),
            image: selectedImage!));
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Place"),
        centerTitle: false,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                NewPlaceTextField(controller: controller),
                const SizedBox(height: 20),
                UploadImage((image) {
                  selectedImage = image;
                }),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(0.7))),
                  onPressed: () {
                    addPlace();
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text("Add Place",
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
