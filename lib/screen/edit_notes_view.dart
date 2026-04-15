import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_application/cubits/note_cubit/notes_cubit.dart';
import 'package:notes_application/model/note_model.dart';
import 'package:notes_application/widget/custom_appbar.dart';
import 'package:notes_application/widget/custom_textfield.dart';

class EditNotesView extends StatefulWidget {
  const EditNotesView({super.key, required this.model});

  static String id = "EditNotes";
  final NoteModel model;

  @override
  State<EditNotesView> createState() => _EditNotesViewState();
}

class _EditNotesViewState extends State<EditNotesView> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 25),
            CustomAppbar(
              onPressed: () {
                widget.model.title = title ?? widget.model.title;
                widget.model.subtitle = subtitle ?? widget.model.subtitle;
                widget.model.save();

                BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              text: 'Edit Note',
              icon: Icons.save,
            ),
            SizedBox(height: 34),
            CustomTextField(
              onChanged: (value) {
                title = value;
              },

              text: widget.model.title,
            ),
            SizedBox(height: 24),
            CustomTextField(
              onChanged: (value) {
                subtitle = value;
              },

              text: widget.model.subtitle,
              maxlines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
