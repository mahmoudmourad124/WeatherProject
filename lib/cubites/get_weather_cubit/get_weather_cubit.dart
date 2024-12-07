import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherproject/cubites/get_weather_cubit/get_weather_state.dart';
import 'package:weatherproject/models/weather_model.dart';
import 'package:weatherproject/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      WeatherModel weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel));
    } on Exception catch (e) {
      emit(WeatherFailurState(e.toString()));
    }
  }
}
