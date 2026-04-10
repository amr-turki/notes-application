import 'dart:ui';

class NoteModel {
  final String title;
  final String subtitle;
  final Color color;
  final String date;

  NoteModel({
    required this.color,
    required this.date,
    required this.subtitle,
    required this.title,
  });
}
