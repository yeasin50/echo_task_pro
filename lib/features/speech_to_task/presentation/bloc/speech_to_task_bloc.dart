import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'speech_to_task_event.dart';
part 'speech_to_task_state.dart';

class SpeechToTaskBloc extends Bloc<SpeechToTaskEvent, SpeechToTaskState> {
  SpeechToTaskBloc() : super(SpeechToTaskInitial()) {
    on<SpeechToTaskEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
