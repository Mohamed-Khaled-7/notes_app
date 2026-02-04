import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noteapp/data/note_model.dart';
import 'package:noteapp/presentation/widdgets/customAppBar.dart';

import 'package:noteapp/presentation/widdgets/cutomTextFeild.dart';
import 'package:noteapp/presentation/widdgets/edit_text_feild.dart';

class EditNoteViewBody extends StatefulWidget {
  EditNoteViewBody({super.key, required this.note});
  NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notes',
        icon: Icon(LucideIcons.check),
        onPressed: () {
          widget.note.title = title ?? widget.note.title;
          widget.note.content = content ?? widget.note.content;
          widget.note.save();
        },
      ),
      body: Column(
        children: [
          Container(
            height: 330,
            child: ListView(
              children: [
                SizedBox(height: 14),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 14),
                  child: EditTextFeild(
                    onChanged: (val) {
                      title = val;
                    },
                    hintText: widget.note.title,
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 14),
                  child: EditTextFeild(
                    onChanged: (val) {
                      content = val;
                    },
                    hintText: widget.note.content,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
