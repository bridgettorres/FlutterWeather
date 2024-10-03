import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'background_event.dart';
part 'background_state.dart';

//Initial state of the timer blox
class BackgroundBloc extends Bloc<BackgroundEvent,BackgroundState> {
  //set initial state
  BackgroundBloc(): super(BackgroundLight()) { 
    on<ToggleOccur>((event,emit){//ToggleOccur is listening for a specific event and then it will perform an action, in which emit is the action which emits a new state
  //here we are waiting for the button to be pressed so that it can cause the background to go light to dark or dark to light
    if (state is BackgroundLight){
      emit(BackgroundDark());
    } else {
      emit(BackgroundLight());
    }
    });

  }
}