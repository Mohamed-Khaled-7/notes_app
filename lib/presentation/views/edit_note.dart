import 'package:flutter/material.dart';
import 'package:noteapp/data/note_model.dart';
import 'package:noteapp/presentation/widdgets/edit_view_body.dart';

class EditNote extends StatelessWidget {
  EditNote({super.key});
  static String id = 'EditNote';
  late NoteModel note;
  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(body: EditNoteViewBody(note: note));
  }
}
