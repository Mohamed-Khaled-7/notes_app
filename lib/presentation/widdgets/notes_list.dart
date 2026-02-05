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
        if (notes.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: const Center(
              child: Text(
                'Start adding your first note and keep your ideas organize',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return NoteItem(
                note: notes[index],
                key: ValueKey(notes[index].key),
              );
            },
            itemCount: notes.length,
          );
        }
      },
    );
  }
}
