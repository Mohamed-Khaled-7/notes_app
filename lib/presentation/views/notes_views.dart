import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noteapp/presentation/widdgets/customAppBar.dart';
import 'package:noteapp/presentation/widdgets/customModelSheet.dart';
import 'package:noteapp/presentation/widdgets/customNoteCard.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  static const id = 'NotesView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notes', icon: Icon(LucideIcons.search)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return CustomNoteCard();
          },
          itemCount: 10,
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
