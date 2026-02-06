import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/business_logic/add_note_cubit/cubit/add_note_cubit_cubit.dart';
import 'package:noteapp/data/note_model.dart';
import 'package:noteapp/presentation/widdgets/customBottom.dart';
import 'package:noteapp/presentation/widdgets/cutomTextFeild.dart';

class CustomNoteForm extends StatefulWidget {
  CustomNoteForm({
    super.key,
    required this.titleHint,
    required this.contentHint,
  });
  String titleHint;
  String contentHint;
  @override
  State<CustomNoteForm> createState() => _CustomNoteFormState();
}

class _CustomNoteFormState extends State<CustomNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  Color currentColor = Colors.white;
  Color pickerColor = Colors.white;
  void changeColor(Color colors) => setState(() => pickerColor = colors);
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          Container(
            height: 330,
            child: ListView(
              children: [
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 14),
                  child: CustomTextField(
                    maxlLines: 1,
                    onChanged: (val) {
                      title = val;
                    },
                    hintText: widget.titleHint,
                    lable: 'title',
                  ),
                ),
                //SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 14),
                  child: CustomTextField(
                    maxlLines: null,
                    onChanged: (val) {
                      content = val;
                    },
                    hintText: widget.contentHint,
                    lable: 'Content',
                  ),
                ),
                SizedBox(height: 25),
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
                              style: GoogleFonts.poppins(
                                color: Colors.cyanAccent,
                              ),
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
                        'Select Color',
                        style: GoogleFonts.poppins(
                          color: Colors.cyanAccent,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  text: 'Add',
                  onPressed: () {
                    onPressed(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onPressed(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var currentDate = DateTime.now();
      var formattedCurrentDate = DateFormat(
        'MMM-dd-yy',
        'en',
      ).format(DateTime.now());
      var note = NoteModel(
        color: currentColor.value,
        title: title!,
        content: content!,
        date: formattedCurrentDate,
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(note);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
