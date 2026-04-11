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
      child: AddNoteForm(),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidatemode = AutovalidateMode.disabled;
  String? tilte, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        children: [
          SizedBox(height: 25),
          CustomTextField(
            text: 'topic',
            maxlines: 1,
            onSaved: (value) {
              tilte = value;
            },
          ),
          SizedBox(height: 25),
          CustomTextField(
            text: 'content',
            maxlines: 4,
            onSaved: (value) {
              tilte = value;
            },
          ),
          SizedBox(height: 65),
          CustomButton(text: 'Save'),
        ],
      ),
    );
  }
}
