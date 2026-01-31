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
          /// The main content of the form.
          Container(
            height: 370,
            child: ListView(
              children: [
                /// A space of 14 units.
                SizedBox(height: 14),

                /// The first text field with a title hint.
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 14),
                  child: CustomTextField(
                    /// When the user saves the text, set the title to the saved value.
                    onSaved: (val) {
                      title = val;
                    },
                    /// The title hint of the text field.
                    hintText: 'title',
                    /// The label of the text field.
                    lable: 'title',
                  ),
                ),

                /// A space of 12 units.
                SizedBox(height: 12),

                /// The second text field with a content hint.
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 14),
                  child: CustomTextField(
                    /// When the user saves the text, set the content to the saved value.
                    onSaved: (val) {
                      content = val;
                    },
                    /// The content hint of the text field.
                    hintText: 'content',
                    /// The label of the text field.
                    lable: 'Content',
                  ),
                ),

                /// A custom button with the label 'Add'.
                CustomButton(
                  text: 'Add',
                  /// When the button is pressed, validate the form and if valid, save
                  /// the form and add a note to the bloc.
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var note= NoteModel(title: title!, content: content!, date: DateTime.now().toString());
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
