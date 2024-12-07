import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherproject/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherproject/cubites/get_weather_cubit/get_weather_state.dart';
import 'package:weatherproject/views/search_view.dart';
import 'package:weatherproject/widgets/no_weather_body.dart';
import 'package:weatherproject/widgets/weather_info_body.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SearchView();
                  }));
                },
                icon: const Icon(Icons.search))
          ],
          title: const Text('Weather App'),
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody(
                weatherModel: state.weatherModel,
              );
            } else {
              return const Text('opps there was an erorr');
            }
          },
        ));
  }
}
