import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/background/bloc/background_bloc.dart';
import 'package:flutter_weather/weather/weather.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_repository/weather_repository.dart'
    show WeatherRepository;

class WeatherApp extends StatelessWidget {
  const WeatherApp({required WeatherRepository weatherRepository, super.key})
      : _weatherRepository = weatherRepository;

  final WeatherRepository _weatherRepository;
  //here is where we add the bloc created inside the bloc provider allowing it to be available throughout the app
  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (_) => WeatherCubit(_weatherRepository),
  //     child: const WeatherAppView(),
  //   );
  // }
  //adding multiple blocs consist of MultiBlocProvider
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WeatherCubit(_weatherRepository),
        ),
        BlocProvider(
          create: (_) => BackgroundBloc(),
        ),
      ],
      child: const WeatherAppView(),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) {
    // final seedColor = context.select(
    //   (WeatherCubit cubit) => cubit.state.weather.toColor(context),
    // );
    /*final seedColor = context.select(
      (WeatherCubit cubit) => cubit.state.weather.toColor,
    );*/
    //BlocBuilder listens to BackgroundBloc to determine the background color
    return BlocBuilder<BackgroundBloc, BackgroundState>(
      builder: (context, state) {
        final BackgroundColor = (state is BackgroundLight)
          //? Colors.black  //this is when in BackgroundDark
          ? Colors.white //this is when in BackgroundLightState
          : const Color.fromARGB(255, 7, 10, 59);
          //: Colors.white; //this is when in BackgroundLightState

        return MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            //colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
            scaffoldBackgroundColor: BackgroundColor,
            textTheme: ThemeData.light().textTheme,
            ),
            home: const WeatherPage(),
          );
        },
    );
  }
}

/*extension on Weather {
  Color get toColor {
    switch (condition) {
      case WeatherCondition.clear:
        return const Color.fromARGB(255, 234, 181, 255);
      case WeatherCondition.snowy:
        return Colors.lightBlueAccent;
      case WeatherCondition.cloudy:
        return Colors.blueGrey;
      case WeatherCondition.rainy:
        return Colors.indigoAccent;
      case WeatherCondition.unknown:
        return Colors.cyan;
    }
  }
}*/

// extension on Weather {
//   Color toColor(BuildContext context) {
//     final isDark = context.read<BackgroundBloc>().state is BackgroundDark;

//     if (condition == WeatherCondition.clear && isDark) {
//       return const Color.fromARGB(0, 0, 0, 0);
//     }

//     switch(condition) {
//       case WeatherCondition.clear:
//         return const Color.fromARGB(255, 255, 253, 181);
//       case WeatherCondition.snowy:
//         return Colors.lightBlueAccent;
//       case WeatherCondition.cloudy:
//         return Colors.blueGrey;
//       case WeatherCondition.rainy:
//         return Colors.indigoAccent;
//       case WeatherCondition.unknown:
//         return Colors.cyan;
//     }
//   }

