import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noteapp/presentation/widdgets/customAppBar.dart';
import 'package:noteapp/presentation/widdgets/customModelSheet.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key});
  static String id = 'EditNote';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notes', icon: Icon(LucideIcons.check)),
      body: CustomModelSheet(),
    );
  }
}
 