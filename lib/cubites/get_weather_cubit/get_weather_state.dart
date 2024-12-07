import 'package:weatherproject/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailurState extends WeatherState {
  final String error;

  WeatherFailurState(this.error);
}
