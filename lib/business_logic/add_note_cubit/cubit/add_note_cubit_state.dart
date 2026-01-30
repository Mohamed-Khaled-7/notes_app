part of 'add_note_cubit_cubit.dart';
@immutable
sealed class AddNoteCubitState {}

final class AddNoteCubitInitial extends AddNoteCubitState {}
class AddNoteLoading  extends AddNoteCubitState {}
class AddNoteSuccess extends AddNoteCubitState {}
class AddNoteFailure extends AddNoteCubitState {
  final String errMessage;
  AddNoteFailure({required this.errMessage});
}