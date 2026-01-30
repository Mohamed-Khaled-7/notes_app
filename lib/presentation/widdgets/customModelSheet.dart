import 'package:flutter/material.dart';
import 'package:noteapp/presentation/widdgets/customBottom.dart';
import 'package:noteapp/presentation/widdgets/customFormFiled.dart';
import 'package:noteapp/presentation/widdgets/cutomTextFeild.dart';

class CustomModelSheet extends StatelessWidget {
  const CustomModelSheet({super.key});

  @override

  Widget build(BuildContext context) {
    return SingleChildScrollView(child: CustomNoteForm());
  }
}
