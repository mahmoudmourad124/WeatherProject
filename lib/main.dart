import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherproject/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherproject/views/homeview.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) => const MaterialApp(
                debugShowCheckedModeBanner: false,
                // theme: ThemeData(
                //     primarySwatch: getThemeColor(
                //         BlocProvider.of<GetWeatherCubit>(context)
                //             .weatherModel
                //             ?.weatherCondition)),
                // theme: ThemeData.dark(),
                home: Homeview(),
              )),
    );
  }
}

// Function to get MaterialColor based on weather condition
MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'sunny':
      return Colors.cyan; // Sunny

    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Colors.grey; // Cloudy conditions

    case 'light rain':
    case 'moderate rain':
    case 'heavy rain':
    case 'patchy rain possible':
    case 'torrential rain shower':
    case 'rain':
    case 'drizzle':
    case 'shower':
      return Colors.blue; // Rainy conditions

    case 'light snow':
    case 'moderate snow':
    case 'heavy snow':
    case 'patchy snow possible':
    case 'blizzard':
    case 'blowing snow':
    case 'snow':
      return Colors.cyan; // Snowy conditions

    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.blueGrey; // Misty/Foggy conditions

    case 'thunder':
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.deepOrange; // Thunderstorms

    case 'sleet':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'patchy sleet possible':
      return Colors.teal; // Sleet conditions

    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.indigo; // Freezing drizzle/rain conditions

    default:
      return Colors.blue;
  }
}
