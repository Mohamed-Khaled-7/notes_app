// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EditTextFeild extends StatelessWidget {
  final String? hintText;
  final Function(String?)? onChanged;
  TextEditingController controller;
  EditTextFeild({
    Key? key,
    this.hintText,
    this.onChanged,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
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
