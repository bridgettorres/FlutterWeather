//our background bloc will need to know how to process the following events
//When the toggle has been used to change the background to light and dark mode

part of 'background_bloc.dart';

sealed class BackgroundEvent {}

final class ToggleOccur extends BackgroundEvent {}