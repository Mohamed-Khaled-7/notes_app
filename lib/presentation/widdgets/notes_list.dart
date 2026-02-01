import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/business_logic/notes_cubit/notes_cubit.dart';
import 'package:noteapp/data/note_model.dart';
import 'package:noteapp/presentation/widdgets/customNoteCard.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        if (notes.length >= 0) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return NoteItem(note: notes[index]);
            },
            itemCount: notes.length,
          );
        } else {
          return Center(
            child: Text(
              'Start Addd Your Notes',
              style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
            ),
          );
        }
      },
    );
  }
}
