

import 'package:flutter/material.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/model/note_model.dart';
import 'package:notes_application/widget/modal_sheet.dart';

class EditColorList extends StatefulWidget {
  final NoteModel model;

  const EditColorList({super.key, required this.model});

  @override
  State<EditColorList> createState() => _ColorBuilderState();
}

class _ColorBuilderState extends State<EditColorList> {
  int currentindex = 0;
  @override
  void initState() {
    // TODO: implement initState

    currentindex = Kcolors.indexOf(Color(widget.model.color));
    super.initState();
  }

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
              widget.model.color = Kcolors[index].value;

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
