import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noteapp/business_logic/notes_cubit/notes_cubit.dart';
import 'package:noteapp/data/note_model.dart';
import 'package:noteapp/presentation/widdgets/customAppBar.dart';
import 'package:noteapp/presentation/widdgets/customModelSheet.dart';
import 'package:noteapp/presentation/widdgets/customNoteCard.dart';
import 'package:noteapp/presentation/widdgets/notes_list.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});
  static const id = 'NotesView';

  @override
  State<NotesView> createState() => _NotesViewState();
}
class _NotesViewState extends State<NotesView> {
  @override
  // initState() {
  //   BlocProvider.of<NotesCubit>(context).fetchAllData();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notes', icon: Icon(LucideIcons.search)),
      body: BlocProvider(
        create: (context) => NotesCubit()..fetchAllData(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: NotesList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const CustomModelSheet();
            },
          );
        },
        child: Icon(LucideIcons.plus),
      ),
    );
  }
}
