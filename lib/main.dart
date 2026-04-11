import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_application/model/note_model.dart';
import 'package:notes_application/screen/edit_notes_view.dart';
import 'package:notes_application/screen/notes_view.dart';
import 'package:notes_application/widget/modal_sheet.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<NoteModel>(NoteModelAdapter());
  await Hive.openBox(KnotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        NotesScreen.id: (context) => NotesScreen(),
        ModalSheet.id: (context) => ModalSheet(),
        EditNotesView.id: (context) => EditNotesView(),
      },
    
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
