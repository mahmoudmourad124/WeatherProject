import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherproject/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'key=e2890f5b7d934931b72211504242010&q';

  WeatherServices(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?$apiKey=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['erroe']['message'] ??
          'opps there was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('opps there was an error, try later');
    }
  }
}
