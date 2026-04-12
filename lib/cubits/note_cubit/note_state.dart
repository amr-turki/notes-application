part of 'notes_cubit.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess extends NoteState {
  final List<NoteModel> models;
  NoteSuccess(this.models);
}

class NoteFailure extends NoteState {
  String message;
  NoteFailure(this.message);
}
