import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_application/cubits/note_cubit/notes_cubit.dart';
import 'package:notes_application/model/note_model.dart';
import 'package:notes_application/screen/edit_notes_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.model});

  final NoteModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditNotesView(model: model)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(model.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    model.title,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                subtitle: Text(
                  model.subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    model.delete();
                    BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                  },
                  icon: Icon(Icons.delete, size: 34),
                ),
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  model.date,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
