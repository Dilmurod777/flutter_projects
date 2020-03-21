import 'package:flutter/material.dart';

const String kOpenWeatherMapURL =
    "https://api.openweathermap.org/data/2.5/weather";
const String kWeatherAPIKey = '8ffe41f15a7d49be2c5f45d532c9799a';
const String kWeatherUnits = 'metric';

const TextStyle kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const TextStyle kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const TextStyle kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const InputDecoration kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
