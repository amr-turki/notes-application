import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.maxlines = 2,
    this.onSaved,
    this.onChanged,
    this.controller,
  });

  final String text;
  final int maxlines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      cursorColor: KPrimaryColor,
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: text,

        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
