import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noteapp/business_logic/notes_cubit/notes_cubit.dart';
import 'package:noteapp/presentation/widdgets/customAppBar.dart';
import 'package:noteapp/presentation/widdgets/customModelSheet.dart';
import 'package:noteapp/presentation/widdgets/notes_list.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});
  static const id = 'NotesView';
  @override
  State<NotesView> createState() => _NotesViewState();
}
class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notes', icon: Icon(LucideIcons.search)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: NotesList(),
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