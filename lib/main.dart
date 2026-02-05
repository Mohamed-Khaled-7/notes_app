import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:noteapp/business_logic/notes_cubit/notes_cubit.dart';
import 'package:noteapp/const/constants.dart';
import 'package:noteapp/data/note_model.dart';
import 'package:noteapp/presentation/views/edit_note.dart';
import 'package:noteapp/presentation/views/notes_views.dart';
import 'package:noteapp/presentation/views/simpleObserver.dart';
import 'package:noteapp/presentation/views/splash_view.dart';

void main() async {
  Bloc.observer = Simpleobserver();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en');
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'SplashScreen': (context) => SplashScreen(),
          'NotesView': (context) => NotesView(),
          'EditNote': (context) => EditNote(),
        },
        initialRoute: 'SplashScreen',
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xff303030),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff303030),
            elevation: 0,
          ),
        ),
        home: const NotesView(),
      ),
    );
  }
}
