import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_application/model/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  List<NoteModel>? models;
  void fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(KnotesBox);

    models = notesBox.values.toList();
    emit(NoteSuccess());
  }
  void searchNotes({required String query}) {
  var notesBox = Hive.box<NoteModel>(KnotesBox);
  
  // بنجيب كل النوتس ونعمل فلتر بناءً على العنوان (Title)
  models = notesBox.values.where((note) {
    return note.title.toLowerCase().contains(query.toLowerCase());
  }).toList();

  // بنحدث الواجهة بالحالات الجديدة
  emit(NoteSuccess());
}
}
