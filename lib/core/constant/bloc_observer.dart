import 'package:blocdemo/shared%20/helper/extension_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    '[BLoC] ${bloc.runtimeType} -> $event'.logs;
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    '[BLoC] ${bloc.runtimeType} change: $change'.logs;
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    '[BLoC] ${bloc.runtimeType} error: $error'.logs;
    super.onError(bloc, error, stackTrace);
  }
}
