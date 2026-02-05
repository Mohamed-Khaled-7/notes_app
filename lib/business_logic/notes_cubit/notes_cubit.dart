import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/const/constants.dart';
import 'package:noteapp/data/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial()) {
    fetchAllData();
  }
  List<NoteModel>? notes;
  List<NoteModel> searchedNotes = [];
  searcheNotes(String query) {
    if (query.isEmpty) {
      searchedNotes = notes!;
    } else {
       searchedNotes = notes!
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
