import 'package:dio/dio.dart';
import 'package:f_project/services/WeatherModel.dart';

class WeatherService {

  final dio = Dio();

  late Response response;
  Future<WeatherModel> GetWeather(String City) async {
    try {
      response = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=f39443b8be304c958a5163615242802&q=$City');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    }
    on DioException catch (e) {
      final String res = e.response?.data['error']['message'] ?? 'there was an error , try later';
      throw (res);
    }
    catch (e){
      throw 'there was an error , try later';
    }
  }
}
