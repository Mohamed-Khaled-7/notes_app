import 'package:flutter_bloc/flutter_bloc.dart';

class Simpleobserver implements BlocObserver
{
  @override
  void onChange(BlocBase bloc, Change change) {
    print('change = $change');
  }
  
  @override
  void onClose(BlocBase<dynamic> close) {
    print('close = $close');
  }
  
  @override
  void onCreate(BlocBase<dynamic> create) {
    print('create = $create');
  }
  
  @override
  void onDone(Bloc<dynamic, dynamic> bloc, Object? event, [Object? error, StackTrace? stackTrace]) {
    // TODO: implement onDone
  }
  
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }
  
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    // TODO: implement onEvent
  }
  
  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    // TODO: implement onTransition
  }
}