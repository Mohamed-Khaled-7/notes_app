import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/business_logic/notes_cubit/notes_cubit.dart';
import 'package:noteapp/data/note_model.dart';
import 'package:noteapp/presentation/widdgets/note_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return NoteItem(note: notes[index]);
          },
          itemCount: notes.length,
        );
      },
    );
  }
}
