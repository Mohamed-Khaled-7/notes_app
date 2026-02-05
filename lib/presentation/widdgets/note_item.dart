import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noteapp/business_logic/notes_cubit/notes_cubit.dart';
import 'package:noteapp/data/note_model.dart';

class NoteItem extends StatefulWidget {
  final NoteModel note;
  const NoteItem({ required super.key, required this.note});

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  bool isdeleted = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'EditNote', arguments: widget.note);
        },
        child: AnimatedSize(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 400),
          onEnd: () {
            if (isdeleted) {
              widget.note.delete();
              BlocProvider.of<NotesCubit>(context).fetchAllData();
            }
          },
          child: isdeleted
              ? const SizedBox.shrink()
              : Container(
                  width: double.infinity,
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: Color(widget.note.color!),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 19),
                                child: Text(
                                  widget.note.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 32,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 22,
                                right: 12,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isdeleted = true;
                                  });
                                },
                                icon: const Icon(
                                  LucideIcons.trash2,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Expanded(
                          child: Text(
                            widget.note.content,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
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
