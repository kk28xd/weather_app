import 'package:f_project/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:f_project/services/WeatherModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Pages/Search_Page.dart';
import '../../services/WeatherService.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(ThereIsNoWeather());
  WeatherModel? weatherModel;

  getWeather({required String value}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await WeatherService().GetWeather(value);
      emit(WeatherLoaded(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
