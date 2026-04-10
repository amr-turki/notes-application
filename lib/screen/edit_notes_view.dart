import 'package:flutter/material.dart';
import 'package:notes_application/widget/custom_appbar.dart';
import 'package:notes_application/widget/custom_textfield.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key});

  static String id = "EditNotes";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 25),
            CustomAppbar(text: 'Edit Note', icon: Icons.close),
            SizedBox(height: 34),
            CustomTextField(text: 'topic'),
            SizedBox(height: 24),
            CustomTextField(text: 'content', maxlines: 2),
          ],
        ),
      ),
    );
  }
}
