import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_application/model/note_model.dart';

part 'note_state.dart';

class AddNoteCubit extends Cubit<NoteState> {
  AddNoteCubit() : super(NoteInitial());

  addNote(NoteModel note) async {
    emit(NoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(KnotesBox);

      emit(NoteSuccess(notesBox.values.toList()));
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }
}
