import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noteapp/business_logic/notes_cubit/notes_cubit.dart';
import 'package:noteapp/data/note_model.dart';

class NoteItem extends StatefulWidget {
  final NoteModel note;
  NoteItem({super.key, required this.note});

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'EditNote');
          },
          child: Container(
            width: double.infinity,
            height: 240,
            //color: Colors.amberAccent,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: Colors.blueAccent,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 19),
                        child: Text(
                          widget.note.title,
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 22, right: 12),
                        child: IconButton(
                          onPressed: () {
                            widget.note.delete();
                          },
                          icon: Icon(
                            LucideIcons.trash2,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    widget.note.content,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 26),
                      child: Text(
                        widget.note.date.toString(),
                        style: GoogleFonts.aBeeZee(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
