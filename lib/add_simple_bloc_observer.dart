import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocProdivedr implements BlocObserver
 {
  @override
  void onEvent(Bloc bloc, Object? event) {
  
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
 }

  @override
  void onChange(BlocBase bloc, Change change) {
   debugPrint('change =$change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    
  }
  
  @override
  void onClose(BlocBase<dynamic> bloc) {
    // TODO: implement onClose
  }
  
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    // TODO: implement onCreate
  }
  
  @override
  void onDone(Bloc<dynamic, dynamic> bloc, Object? event, [Object? error, StackTrace? stackTrace]) {
    // TODO: implement onDone
  }
}