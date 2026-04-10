import 'package:flutter/material.dart';
import 'package:notes_application/widget/custom_appbar.dart';
import 'package:notes_application/widget/note_item.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  static String id = "NotesView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 25),
            CustomAppbar(text: 'Notes', icon: Icons.search),

            SizedBox(height: 34),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: NoteItem(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
