import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noteapp/business_logic/notes_cubit/notes_cubit.dart';
import 'package:noteapp/const/constants.dart';
import 'package:noteapp/data/note_model.dart';
import 'package:noteapp/presentation/widdgets/customAppBar.dart';
import 'package:noteapp/presentation/widdgets/customModelSheet.dart';
import 'package:noteapp/presentation/widdgets/note_view_body.dart';
import 'package:noteapp/presentation/widdgets/notes_list.dart';
import 'package:noteapp/presentation/widdgets/searche_delegated.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});
  static const id = 'NotesView';
  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    NotesCubit notes = BlocProvider.of<NotesCubit>(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notes',
        icon: Icon(LucideIcons.search),
        onPressed: () {
          showSearch(
            context: context,
            delegate: SearchNotesDelegate(),
          );
        },
      ),
      body: NotesViewBody(),
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
