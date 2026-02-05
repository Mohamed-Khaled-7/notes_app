import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noteapp/business_logic/notes_cubit/notes_cubit.dart';
import 'package:noteapp/data/note_model.dart';
import 'package:noteapp/presentation/widdgets/note_item.dart';

class SearchNotesDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () => query = '', icon: Icon(LucideIcons.x))];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(LucideIcons.arrowLeft),
      onPressed: () => {
        close(context, null),
        BlocProvider.of<NotesCubit>(context).fetchAllData(),
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<NotesCubit>().searcheNotes(query);
    List<NoteModel> results = context.read<NotesCubit>().notesSearched;
    if (results.isEmpty) {
      return Center(
        child: Text(
          'No resultls founded',
          style: GoogleFonts.poppins(fontSize: 23, color: Colors.white),
        ),
      );
    } else {
      results = results
          .where(
            (note) =>
                note.title.toLowerCase().contains(query.toLowerCase()) ||
                note.content.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return NoteItem(
          note: results[index],
          key: ValueKey(results[index].key),
        );
      },
      itemCount: results.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
