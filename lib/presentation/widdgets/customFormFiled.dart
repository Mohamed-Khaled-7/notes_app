
import 'package:flutter/material.dart';
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
                    onSaved: (val) {
                      title = val;
                    },
                    hintText: 'title',
                    lable: 'title',
                  ),
                ),

                /// A space of 12 units.
                SizedBox(height: 12),

                /// The second text field with a content hint.
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
