import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lib_event.dart';
part 'lib_state.dart';

class LibBloc extends Bloc<LibEvent, LibState> {
  LibBloc() : super(LibInitial()) {
    on<LibEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
