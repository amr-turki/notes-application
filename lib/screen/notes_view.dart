import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_application/cubits/note_cubit/notes_cubit.dart';
import 'package:notes_application/widget/custom_appbar.dart';
import 'package:notes_application/widget/modal_sheet.dart';
import 'package:notes_application/widget/notes_builder.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  static String id = "NotesView";

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(
      context,
    ).fetchAllNotes(); // TODO: implement initState
    super.initState();
  }

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
      body: Column(
        children: [
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomAppbar(text: 'Notes', icon: Icons.search),
          ),

          SizedBox(height: 34),
          Expanded(child: NotesBuilder()),
        ],
      ),
    );
  }
}
