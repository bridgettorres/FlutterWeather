//different states whcih the bloc can be in
//each of thee state will be of the user interface and actions that the user can perform 

//if the state is at 
//backgroundDark - the user will be able to turn the background to Light
//backgroundLight - the user will be able to turn the background to Dark

part of 'background_bloc.dart'; //the file containing this code is part of the file backgroun_bloc.dart

//equatable is a package in dart that allows you to compare objects based on their content
sealed class BackgroundState extends Equatable{
  const BackgroundState();

  @override
  List<Object> get props =>[];
  }
//defininng the two states which are for the dark abckground and for the light background
class BackgroundDark extends BackgroundState {}
class BackgroundLight extends BackgroundState {}

