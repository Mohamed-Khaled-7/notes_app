import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomNoteCard extends StatelessWidget {
  CustomNoteCard({super.key, required this.color});
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            color: color,
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
                        'Flutter tips',
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22, right: 12),
                      child: IconButton(
                        onPressed: () {},
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
                  'Build Your Career with\n Tharwat Samy',
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
                      'May 12,2026',
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
    );
  }
}
