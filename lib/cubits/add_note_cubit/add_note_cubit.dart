import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/model/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = const Color.fromARGB(255, 187, 116, 111);
  Future<void> addNote(NoteModel note) async {
    note.color = color.value;

    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(KnotesBox);

      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
  
}
