import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_application/cubits/note_cubit/notes_cubit.dart';
import 'package:notes_application/model/note_model.dart';
import 'package:notes_application/widget/custom_appbar.dart';
import 'package:notes_application/widget/modal_sheet.dart';
import 'package:notes_application/widget/note_item.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  static String id = "NotesView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),

            context: context,
            builder: (context) {
              return ModalSheet();
            },
          );
        },
        child: Icon(Icons.add, size: 18),
      ),
      body: BlocBuilder(
        builder: (context, state) {
          List<NoteModel> models =
              BlocProvider.of<NoteCubit>(context).models ?? [];

          return Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 25),
                CustomAppbar(text: 'Notes', icon: Icons.search),

                SizedBox(height: 34),
                Expanded(
                  child: ListView.builder(
                    itemCount: state is NoteSuccess ? state.models.length : 0,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: NoteItem(model: models[index]),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
