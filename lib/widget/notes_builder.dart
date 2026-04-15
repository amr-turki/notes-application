import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_application/cubits/note_cubit/notes_cubit.dart';
import 'package:notes_application/model/note_model.dart';
import 'package:notes_application/widget/note_item.dart';

class NotesBuilder extends StatelessWidget {
  const NotesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        List<NoteModel> models =
            BlocProvider.of<NoteCubit>(context).models ?? [];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListView.builder(
            itemCount: models.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: NoteItem(model: models[index]),
            ),
          ),
        );
      },
    );
  }
}
