import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather%20cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather%20cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  double elevation = 5;
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: elevation,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: Icon(Icons.search))
        ],
        title: Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: ((context, state) {
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccess) {
            elevation = 0;
            return SuccessBody(weatherData: state.weatherModel);
          } else if (state is WeatherFailure) {
            return Center(child: Text('Something went wrong please try again'));
          } else {
            return DefuaultBody();
          }
        }),
      ),
    );
  }
}

class DefuaultBody extends StatelessWidget {
  const DefuaultBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          weatherData!.getThemeColor(),
          weatherData!.getThemeColor()[50]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 3),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network('https:${weatherData!.imag}'),
              Text(
                '${weatherData!.temp.toInt()}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text('maxTemp:${weatherData!.maxTemp.toInt()}'),
                  Text('minTemp:${weatherData!.minTemp.toInt()}'),
                ],
              )
            ],
          ),
          Spacer(),
          Text(
            '${weatherData!.weatherStateName}',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(flex: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('tod'),
                  Image.network('https:${weatherData!.imag1}'),
                  Text(weatherData!.maxTemp1.toInt().toString()),
                  Text(weatherData!.minTemp1.toInt().toString()),
                ],
              ),
              Column(
                children: [
                  Text('tod'),
                  Image.network('https:${weatherData!.imag2}'),
                  Text(weatherData!.maxTemp2.toInt().toString()),
                  Text(weatherData!.minTemp2.toInt().toString()),
                ],
              ),
              Column(
                children: [
                  Text('tod'),
                  Image.network('https:${weatherData!.imag3}'),
                  Text(weatherData!.maxTemp3.toInt().toString()),
                  Text(weatherData!.minTemp3.toInt().toString()),
                ],
              ),
              Column(
                children: [
                  Text('tod'),
                  Image.network('https:${weatherData!.imag4}'),
                  Text(weatherData!.maxTemp4.toInt().toString()),
                  Text(weatherData!.minTemp4.toInt().toString()),
                ],
              ),
              Column(
                children: [
                  Text('tod'),
                  Image.network('https:${weatherData!.imag5}'),
                  Text(weatherData!.maxTemp5.toInt().toString()),
                  Text(weatherData!.minTemp5.toInt().toString()),
                ],
              ),
            ],
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }
}
