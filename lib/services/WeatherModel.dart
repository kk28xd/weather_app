class WeatherModel {
  final String CityName;
  final DateTime Date;
  final String Img;
  final double CurrentTemp;
  final double MinTemp;
  final double MaxTemp;
  final String WeatherState;

  WeatherModel(
      {required this.CityName,
      required this.Date,
      required this.Img,
      required this.CurrentTemp,
      required this.MinTemp,
      required this.MaxTemp,
      required this.WeatherState});

  factory WeatherModel.fromJson(i) {
    return WeatherModel(
      CityName: i['location']['name'],
      Date: DateTime.parse(i['current']['last_updated']),
      Img: i['current']['condition']['icon'],
      CurrentTemp: i['current']['temp_c'],
      MinTemp: i['forecast']['forecastday'][0]['day']['mintemp_c'],
      MaxTemp: i['forecast']['forecastday'][0]['day']['maxtemp_c'],
      WeatherState: i['current']['condition']['text'],
    );
  }
}
