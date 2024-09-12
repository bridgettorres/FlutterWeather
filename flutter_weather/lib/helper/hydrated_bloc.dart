// lib/helpers/hydrated_bloc.dart
import 'package:hydrated_bloc/hydrated_bloc.dart';

Future<void> initHydratedStorage() async {
  await HydratedBloc.storage;
}