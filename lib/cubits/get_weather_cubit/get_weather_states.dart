import '../../services/WeatherModel.dart';

abstract class WeatherState {}

class ThereIsNoWeather extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoaded({required this.weatherModel});
}

class WeatherFailure extends WeatherState {}
