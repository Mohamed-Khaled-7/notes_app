import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noteapp/business_logic/notes_cubit/notes_cubit.dart';
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
  Color currentColor = Colors.white;
  Color pickerColor = Colors.white;
  void changeColor(Color color) => {pickerColor = color};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notes',
        icon: Icon(LucideIcons.check),
        onPressed: () {
          widget.note.title = title ?? widget.note.title;
          widget.note.content = content ?? widget.note.content;
          widget.note.color = currentColor.value ?? widget.note.color;
          widget.note.save();
          Navigator.pop(context);
          BlocProvider.of<NotesCubit>(context).fetchAllData();
        },
      ),
      body: Column(
        children: [
          Container(
            height: 220,
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
          Center(
            child: Container(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Select Color',
                        style: GoogleFonts.poppins(color: Colors.cyanAccent),
                      ),
                      content: ColorPicker(
                        pickerColor: pickerColor,
                        onColorChanged: changeColor,
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              currentColor = pickerColor;
                            });
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Got it',
                            style: GoogleFonts.poppins(
                              color: Colors.cyanAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                  'Edit Color',
                  style: GoogleFonts.poppins(
                    color: Colors.cyanAccent,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
