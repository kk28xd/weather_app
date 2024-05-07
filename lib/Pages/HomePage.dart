import 'package:f_project/Pages/Search_Page.dart';
import 'package:f_project/Widgets/exit_weather.dart';
import 'package:f_project/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Widgets/No_Weather.dart';
import '../cubits/get_weather_cubit/get_weather_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is ThereIsNoWeather) {
            return const NoWeather();
          } else if (state is WeatherLoaded) {
            return ExitWeather();
          } else if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
                child:
                    Text('There was an error', style: TextStyle(fontSize: 25)));
          }
        },
      ),
    );
  }
}
