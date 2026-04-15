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
  bool isSearching = false;
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
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: isSearching ? buildSearchField() : buildDefaultAppBar(),
          ),
          SizedBox(height: 35),
          Expanded(child: NotesBuilder()),
        ],
      ),
    );
  }

  Widget buildDefaultAppBar() {
    return CustomAppbar(
      onPressed: () {
        setState(() {
          isSearching = true;
        });
      },
      text: 'Notes',
      icon: Icons.search,
    );
  }

  Widget buildSearchField() {
    return TextField(
      autofocus: true,
      onChanged: (value) {
        BlocProvider.of<NoteCubit>(context).searchNotes(query: value);
      },
      decoration: InputDecoration(
        hintText: 'Search for a note...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            setState(() {
              isSearching = false;
              BlocProvider.of<NoteCubit>(context).fetchAllNotes();
            });
          },
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
