import 'package:flutter/material.dart';
import 'package:notes_application/widget/custom_button.dart';
import 'package:notes_application/widget/custom_textfield.dart';

class ModalSheet extends StatelessWidget {
  const ModalSheet({super.key});

  static String id = "ModalSheet";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 25),
          CustomTextField(text: 'topic', maxlines: 1),
          SizedBox(height: 25),
          CustomTextField(text: 'content', maxlines: 4),
          SizedBox(height: 65),
          CustomButton(text: 'Save'),
        ],
      ),
    );
  }
}
