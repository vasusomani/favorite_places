import 'package:flutter/material.dart';

class NewPlaceTextField extends StatefulWidget {
  const NewPlaceTextField({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  State<NewPlaceTextField> createState() => _NewPlaceTextFieldState();
}

class _NewPlaceTextFieldState extends State<NewPlaceTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Can't be empty";
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        style: TextStyle(color: Theme.of(context).cardColor),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: "Title",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }
}
