part of 'notes_cubit.dart';

sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NoteLoaded extends NotesState {}

final class NoteSearchedSuccess extends NotesState {}
