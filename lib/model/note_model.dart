import 'package:hive_flutter/hive_flutter.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  int color;
  @HiveField(3)
  String date;

  NoteModel({
    required this.color,
    required this.date,
    required this.subtitle,
    required this.title,
  });
}
