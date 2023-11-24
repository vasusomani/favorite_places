import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showImageFromPopUpDialog(
    BuildContext context, Function({bool isCamera}) pickImage) async {
  if (Platform.isIOS) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
              onPressed: () => pickImage(isCamera: true).then((value) {
                    Navigator.pop(context);
                  }),
              child: const Text("Take a photo")),
          CupertinoActionSheetAction(
              onPressed: () => pickImage(isCamera: false).then((value) {
                    Navigator.pop(context);
                  }),
              child: const Text("Upload from gallery"))
        ],
      ),
    );
  } else {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            onTap: () => pickImage(isCamera: true).then((value) {
              Navigator.pop(context);
            }),
            leading: const Icon(CupertinoIcons.camera_fill),
            title: const Text("Take a photo"),
            titleTextStyle: Theme.of(context).textTheme.titleMedium,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          const Divider(
            indent: 16,
            endIndent: 16,
            height: 0,
          ),
          ListTile(
            leading: const Icon(Icons.photo_size_select_actual_rounded),
            onTap: () => pickImage(isCamera: false).then((value) {
              Navigator.pop(context);
            }),
            title: const Text("Upload from gallery"),
            titleTextStyle: Theme.of(context).textTheme.titleMedium,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          )
        ],
      ),
    );
  }
}
