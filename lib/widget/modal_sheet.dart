import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_application/cubits/note_cubit/notes_cubit.dart';
import 'package:notes_application/model/note_model.dart';
import 'package:notes_application/widget/custom_button.dart';
import 'package:notes_application/widget/custom_textfield.dart';

class ModalSheet extends StatelessWidget {
  const ModalSheet({super.key});

  static String id = "ModalSheet";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AddNoteForm(),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidatemode = AutovalidateMode.disabled;
  String? tilte, subtitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<NoteCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: globalKey,
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      CustomTextField(
                        text: 'topic',
                        maxlines: 1,
                        onSaved: (value) {
                          tilte = value;
                        },
                      ),
                      SizedBox(height: 25),
                      CustomTextField(
                        text: 'content',
                        maxlines: 4,
                        onSaved: (value) {
                          subtitle = value;
                        },
                      ),
                      SizedBox(height: 35),
                      ColorBuilder(),
                      CustomButton(
                        isLoading: state is AddNoteLoading ? true : false,
                        text: 'Save',
                        onTap: () {
                          if (globalKey.currentState!.validate()) {
                            globalKey.currentState!.save();

                            var currentdata = DateFormat.yMEd().format(
                              DateTime.now(),
                            );
                            var noteModel = NoteModel(
                              color: Colors.blue.value,
                              date: currentdata,
                              subtitle: subtitle!,
                              title: tilte!,
                            );
                            BlocProvider.of<AddNoteCubit>(
                              context,
                            ).addNote(noteModel);
                          } else {
                            autovalidatemode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.active, required this.color});

  final Color color;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return active
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            child: CircleAvatar(backgroundColor: color, radius: 35),
          )
        : CircleAvatar(backgroundColor: color, radius: 35);
  }
}

class ColorBuilder extends StatefulWidget {
  @override
  State<ColorBuilder> createState() => _ColorBuilderState();
}

class _ColorBuilderState extends State<ColorBuilder> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemCount: Kcolors.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: GestureDetector(
            onTap: () {
              currentindex = index;
              BlocProvider.of<AddNoteCubit>(context).color = Kcolors[index];

              setState(() {});
            },
            child: ColorItem(
              color: Kcolors[index],
              active: currentindex == index,
            ),
          ),
        ),
      ),
    );
  }
}
