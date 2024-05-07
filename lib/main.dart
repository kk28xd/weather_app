import 'package:f_project/Pages/HomePage.dart';
import 'package:f_project/Pages/Search_Page.dart';
import 'package:f_project/Widgets/exit_weather.dart';
import 'package:f_project/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/get_weather_cubit/get_weather_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) => MaterialApp(
            theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: getMaterialColorForWeather(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.WeatherState))),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
            routes: {
              'search': (context) => const SearchPage(),
              'weather': (context) => const ExitWeather(),
            },
          ),
        ),
      ),
    );
  }
}

MaterialColor getMaterialColorForWeather(String? condition) {
  if (condition == null) {
    return Colors.grey;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.amber;
    case 'Partly cloudy':
      return Colors.blue;
    case 'Cloudy':
      return Colors.blueGrey;
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
      return Colors.lightBlue;
    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Patchy light rain':
    case 'Patchy light rain with thunder':
    case 'Patchy light snow':
    case 'Patchy light snow with thunder':
      return Colors.lightBlue;
    case 'Patchy snow possible':
    case 'Patchy moderate snow':
    case 'Light snow':
    case 'Light snow showers':
    case 'Light sleet':
    case 'Light sleet showers':
    case 'Light showers of ice pellets':
      return Colors.blueGrey;
    case 'Patchy sleet possible':
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy sleet showers':
    case 'Moderate or heavy showers of ice pellets':
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.lightBlue;
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.blue;
    case 'Thundery outbreaks possible':
    case 'Moderate or heavy rain with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Torrential rain shower':
    case 'Moderate or heavy rain shower':
      return Colors.blue;
    case 'Heavy freezing drizzle':
    case 'Heavy sleet':
    case 'Heavy sleet showers':
    case 'Heavy snow':
    case 'Heavy snow showers':
    case 'Ice pellets':
      return Colors.blueGrey;
    default:
      return Colors.grey;
  }
}
