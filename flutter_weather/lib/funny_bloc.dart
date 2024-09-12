import 'package:flutter_bloc/flutter_bloc.dart';
//a blc is more advanced class which relies on events to trigger state
//BLOC extends to bloc base
//Blocs recieve events and convert the incoming events into outgoing states

//sealed shows that the class is intended to be used as a base class
sealed class FunEvent {} //base class for all events related to the funevent. A class that will be used to extend to create specific types of events
//Fun pressed is a specific event that exnteds Funevent. This class represents an action that the bloc should handle
final class HotPressed extends FunEvent{}
final class ColdPressed extends FunEvent{}


class FunBloc extends Bloc<FunEvent, int> { //Here funevent is the type of events bloc will handle and int is the type of state that Bloc will manage
  FunBloc() : super(0){ //initial state 
    on<HotPressed>((event, emit) => emit(state + 1)); //for each hotpreseed event we are accessing the state of the bloc and adding 1 to i t
    on<ColdPressed>((event, emit) => emit(state - 1));
}
}