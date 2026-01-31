import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/business_logic/add_note_cubit/cubit/add_note_cubit_cubit.dart';
import 'package:noteapp/data/note_model.dart';
import 'package:noteapp/presentation/widdgets/customBottom.dart';
import 'package:noteapp/presentation/widdgets/cutomTextFeild.dart';

class CustomNoteForm extends StatefulWidget {
  CustomNoteForm({super.key});

  @override
  State<CustomNoteForm> createState() => _CustomNoteFormState();
}

class _CustomNoteFormState extends State<CustomNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
                SizedBox(height: 14),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 14),
                  child: CustomTextField(
                    onSaved: (val) {
                      title = val;
                    },
                    hintText: 'title',
                    lable: 'title',
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 14),
                  child: CustomTextField(
                    onSaved: (val) {
                      content = val;
                    },
                    hintText: 'content',
                    lable: 'Content',
                  ),
                ),

                CustomButton(
                  text: 'Add',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var note = NoteModel(
                        title: title!,
                        content: content!,
                        date: DateTime.now().toString(),
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(note);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
