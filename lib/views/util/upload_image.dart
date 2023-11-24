import 'dart:io';
import 'package:favorite_places/views/util/image_from_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:image_picker/image_picker.dart";

class UploadImage extends ConsumerStatefulWidget {
  const UploadImage(this.getImage, {Key? key}) : super(key: key);
  final void Function(File image) getImage;

  @override
  ConsumerState<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends ConsumerState<UploadImage> {
  File? selectedImage;
  void pickImage({bool isCamera = true}) async {
    final imagePicker = ImagePicker();
    XFile? pickedImage = await imagePicker.pickImage(
        source: (isCamera) ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 600);
    if (pickedImage == null) return;
    setState(() {
      selectedImage = File(pickedImage.path);
      widget.getImage(selectedImage!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showImageFromPopUpDialog(context, pickImage);
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 3, // Corrected line here
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2))),
        child: (selectedImage == null)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.photo_rounded, color: Colors.grey),
                  const SizedBox(width: 10),
                  Text("Upload an image",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.grey))
                ],
              )
            : Image.file(selectedImage!, fit: BoxFit.cover),
      ),
    );
  }
}
