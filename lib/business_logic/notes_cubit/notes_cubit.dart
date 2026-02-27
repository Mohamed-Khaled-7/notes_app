import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:noteapp/const/constants.dart';
import 'package:noteapp/data/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial()) {
    fetchAllData();
  }
  List<NoteModel>? notes;
  List<NoteModel> notesSearched = [];
  void searcheNotes(String query) {
    if (query.isEmpty) {
      notesSearched = notes!;
    } else {
      notesSearched = notes!
          .where(
            (note) =>
                note.title.toLowerCase().contains(query.toLowerCase()) ||
                note.content.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
    emit(NoteSearchedSuccess());
  }

  fetchAllData() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NoteLoaded());
  }
}
