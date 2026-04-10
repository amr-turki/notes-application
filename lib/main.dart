import 'package:flutter/material.dart';
import 'package:notes_application/screen/notes_view.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {NotesScreen.id: (context) => NotesScreen()},

      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
