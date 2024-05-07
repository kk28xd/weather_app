import 'dart:developer';
import 'package:f_project/Pages/HomePage.dart';
import 'package:f_project/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:f_project/services/WeatherModel.dart';
import 'package:f_project/services/WeatherService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Scaffold(
      body: SafeArea(
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
                padding: const EdgeInsets.only(left: 5,top: 15),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_sharp,
                          size: 26,
                        )),
                    const Text(
                      'Search a city',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Center(
                        child: TextField(
                          onSubmitted: (value) async {
                            BlocProvider.of<GetWeatherCubit>(context).getWeather(value: value);
                            Navigator.pop(context);
                          },
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsetsDirectional.symmetric(
                                  vertical: 32, horizontal: 16),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                              label: Text('Search',
                                  style: TextStyle(color: Colors.black)),
                              hintText: 'Enter City Name',
                              suffixIcon: Icon(Icons.search)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
