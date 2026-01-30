import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String lable;
  final Function(String?)? onSaved;
  CustomTextField({
    super.key,
    required this.hintText,
    required this.lable,
    this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        if (val?.isEmpty ?? true) {
          return 'Feild is required';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      maxLines: null,
      cursorColor: Colors.white,
      style: GoogleFonts.poppins(color: Color(0xff52EBD6)),
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: GoogleFonts.poppins(
          color: Color(0xff52EBD6),
          fontWeight: FontWeight.bold,
        ),
        hintStyle: GoogleFonts.poppins(color: Color(0xff52EBD6)),
        floatingLabelStyle: GoogleFonts.poppins(color: Color(0xff52EBD6)),
        filled: true,
        labelText: lable,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xff52EBD6)),
        ),
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xff52EBD6), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xff52EBD6), width: 1.5),
        ),
      ),
    );
  }
}
