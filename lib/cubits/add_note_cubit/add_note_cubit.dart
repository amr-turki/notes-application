import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/model/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(KnotesBox);
      emit(AddNoteSuccess());
      await notesBox.add(note);
    } catch (e) {
      AddNoteFailure(e.toString());
    }
  }
}
