import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_application/cubits/add_note_cubit/add_note_cubit.dart';
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

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteLoading) {
            isLoading = true;
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
                          tilte = value;
                        },
                      ),
                      SizedBox(height: 65),
                      CustomButton(
                        isLoading: state is AddNoteLoading ? true : false,
                        text: 'Save',
                        onTap: () {
                          if (globalKey.currentState!.validate()) {
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
                            globalKey.currentState!.save();
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
