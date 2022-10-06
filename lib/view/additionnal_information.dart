import 'package:flutter/material.dart';
import 'package:meteo_test/service/weather_api_client.dart';

import '../model/weather-model.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18);

TextStyle infoFont = const TextStyle(fontWeight: FontWeight.w400, fontSize: 18);
WeatherApiClient client = WeatherApiClient();
Weather? data;
// Future<void> getData() async {
//   data = await client.getCurrentWeather("");
// }

// var ville = "";
// void submit(String ville) {
//   ville = client.getCurrentWeather ;
// }

Widget additionnalInforation(
    String wind, String humidity, String pressure, String feels_like) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text("${ville}"),
        TextField(
          decoration: const InputDecoration(
            hintText: 'Enter this country',
          ),
          // onSubmitted: submit
          // validator: (String? value) {
          //   if (value == null || value.isEmpty) {
          //     return 'Please enter country';
          //   }
          //   return null;
          // },
        ),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Valid'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Vent",
                  style: titleFont,
                ),
                SizedBox(height: 18.0),
                Text("Pression", style: titleFont),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$wind",
                  style: infoFont,
                ),
                SizedBox(height: 18.0),
                Text("$pressure", style: infoFont),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Humidité",
                  style: titleFont,
                ),
                SizedBox(height: 18.0),
                Text("Se sent aime", style: titleFont),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$wind",
                  style: infoFont,
                ),
                SizedBox(height: 18.0),
                Text("$pressure", style: infoFont),
              ],
            ),
            SizedBox(height: 100.0),
            ///////
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       "Hi",
            //       style: infoFont,
            //     ),
            //   ],
            // ),
            //////
          ],
        ),
      ],
    ),
  );
}
