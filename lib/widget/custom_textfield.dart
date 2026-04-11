import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.maxlines = 2,
     this.onSaved,
  });

  final String text;
  final int maxlines;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is required';
        }
      },
      cursorColor: KPrimaryColor,
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: text,

        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        border: borderBuilder(),
        enabledBorder: borderBuilder(),
        focusedBorder: borderBuilder(),
      ),
    );
  }
}

OutlineInputBorder borderBuilder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Colors.black),
  );
}
