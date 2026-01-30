import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapp/presentation/views/edit_note.dart';
import 'package:noteapp/presentation/views/notes_views.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('notes_box');
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'NotesView': (context) => NotesView(),
        'EditNote': (context) => EditNote(),
      },
      initialRoute: 'NotesView',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff303030),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff303030),
          elevation: 0,
        ),
      ),
      home: const NotesView(),
    );
  }
}
