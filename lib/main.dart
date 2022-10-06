// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:meteo_test/model/weather-model.dart';
import 'package:meteo_test/service/weather_api_client.dart';
import 'package:meteo_test/view/additionnal_information.dart';
import 'package:meteo_test/view/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherApiClient client = WeatherApiClient();

  Weather? data;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   client.getCurrentWeather("dakar");
  // }

  Future<void> getData() async {
    data = await client.getCurrentWeather("Paris");
  }

  // TextField(
  //           decoration: const InputDecoration(
  //             hintText: 'Enter your email',
  //           ),
  //           onSubmitted:
  //           // validator: (String? value) {
  //           //   if (value == null || value.isEmpty) {
  //           //     return 'Please enter some text';
  //           //   }
  //           //   return null;
  //           // },
  //         ),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFf9f9f9),
        elevation: 0.0,
        title: Text("Weather app", style: TextStyle(color: Colors.black)),
        leading: Icon(Icons.home),
      ),

      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                currentWeather(Icons.wb_sunny_rounded, "${data!.temp}",
                    "${data!.cityName}"),
                SizedBox(height: 60.0),
                Text("Information supplementaires",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xdd212121),
                      fontWeight: FontWeight.bold,
                    )),
                Divider(),
                SizedBox(height: 10),
                additionnalInforation("${data!.wind}", "${data!.humidity}",
                    "${data!.pressure}", "${data!.feels_like}")
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
              //  child:Column(
              //   mainAxisAlignment : MainAxisAlignment.center,
              //   children : [
              //     TextField(decoration:InputDecoration(
              //        labelText : "Ville",
              //        hintText : "Entrez une ville",
              //     ),

              //     ),
              //   ],
              //  ),
              );
        },
      ),

      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: <Widget>[
      //     currentWeather(Icons.wb_sunny_rounded, "23.0", "Dakar"),
      //     SizedBox(height: 60.0),
      //     Text("Additionial information",
      //         style: TextStyle(
      //           fontSize: 24.0,
      //           color: Color(0xdd212121),
      //           fontWeight: FontWeight.bold,
      //         )),
      //     Divider(),
      //     SizedBox(height: 10),
      //     additionnalInforation("24", "2", "1041", "24.6")
      //   ],
      // ),
    );
  }
}
