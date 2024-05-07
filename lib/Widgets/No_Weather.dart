import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../main.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          getMaterialColorForWeather(weatherModel?.WeatherState),
          getMaterialColorForWeather(weatherModel?.WeatherState)[300]!,
          getMaterialColorForWeather(weatherModel?.WeatherState)[100]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 15,right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Weather App',
                    style: TextStyle(fontSize: 24),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('search');
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 26,
                      ))
                ],
              ),
            ),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('there is no weather 😔 start',
                      style: TextStyle(fontSize: 25)),
                  Text('searching now 🔍', style: TextStyle(fontSize: 25))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
