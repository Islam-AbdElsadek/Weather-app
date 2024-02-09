import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String imag;
  int iCode;
  double maxTemp1;
  double minTemp1;
  String imag1;
  double maxTemp2;
  double minTemp2;
  String imag2;
  double maxTemp3;
  double minTemp3;
  String imag3;
  double maxTemp4;
  double minTemp4;
  String imag4;
  double maxTemp5;
  double minTemp5;
  String imag5;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.imag,
    required this.iCode,
    required this.imag1,
    required this.imag3,
    required this.imag2,
    required this.imag4,
    required this.imag5,
    required this.maxTemp1,
    required this.maxTemp2,
    required this.maxTemp3,
    required this.minTemp1,
    required this.minTemp2,
    required this.minTemp3,
    required this.maxTemp4,
    required this.minTemp4,
    required this.maxTemp5,
    required this.minTemp5,
  });
  factory WeatherModel.fromjson(dynamic data) {
    var jsonDatac = data['current'];
    var jsonDataf = data['forecast']['forecastday'];
    return WeatherModel(
      date: DateTime.parse(data['current']['last_updated']),
      temp: jsonDatac['temp_c'],
      maxTemp: jsonDataf[0]['day']['maxtemp_c'],
      minTemp: jsonDataf[0]['day']['mintemp_c'],
      weatherStateName: jsonDataf[0]['day']['condition']['text'],
      imag: data['current']['condition']['icon'],
      iCode: data['current']['condition']['code'],
      imag1: jsonDataf[1]['day']['condition']['icon'],
      maxTemp1: jsonDataf[1]['day']['maxtemp_c'],
      minTemp1: jsonDataf[1]['day']['mintemp_c'],
      imag2: jsonDataf[2]['day']['condition']['icon'],
      maxTemp2: jsonDataf[2]['day']['maxtemp_c'],
      minTemp2: jsonDataf[2]['day']['mintemp_c'],
      imag3: jsonDataf[3]['day']['condition']['icon'],
      maxTemp3: jsonDataf[3]['day']['maxtemp_c'],
      minTemp3: jsonDataf[3]['day']['mintemp_c'],
      imag4: jsonDataf[4]['day']['condition']['icon'],
      maxTemp4: jsonDataf[4]['day']['maxtemp_c'],
      minTemp4: jsonDataf[4]['day']['mintemp_c'],
      imag5: jsonDataf[5]['day']['condition']['icon'],
      maxTemp5: jsonDataf[5]['day']['maxtemp_c'],
      minTemp5: jsonDataf[5]['day']['mintemp_c'],
    );
  }

  MaterialColor getThemeColor() {
    if (iCode == 1003 || iCode == 1000) {
      return Colors.cyan;
    } else if (iCode == 1009 || iCode == 1006) {
      return Colors.teal;
    } else if (iCode <= 1117 && iCode >= 1030) {
      return Colors.indigo;
    } else if (iCode <= 1282 && iCode >= 1135) {
      return Colors.blueGrey;
    } else {
      return Colors.cyan;
    }
  }
}
