import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapp/business_logic/add_note_cubit/cubit/add_note_cubit_cubit.dart';
import 'package:noteapp/const/constants.dart';
import 'package:noteapp/data/note_model.dart';
import 'package:noteapp/presentation/views/edit_note.dart';
import 'package:noteapp/presentation/views/notes_views.dart';
import 'package:noteapp/presentation/views/simpleObserver.dart';

void main() async {
  Bloc.observer = Simpleobserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
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
