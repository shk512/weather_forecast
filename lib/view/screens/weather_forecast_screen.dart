import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/model/forecast_model.dart';
import 'package:weather_forecast/state_management/language_handler.dart';
import 'package:weather_forecast/utils/constants.dart';
import 'package:weather_forecast/view/widgets/background.dart';
import 'package:weather_forecast/view_model/forecast_view_model.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageHandler>(builder: (context, language, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            languageMap[language.languageCode]!["weatherForecast"] ?? "",
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: [
            DropdownButton(
                hint: const Icon(CupertinoIcons.globe),
                items: const [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text("English"),
                  ),
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text("عربي"),
                  ),
                ],
                onChanged: (val) {
                  if (val != null) {
                    language.setLanguageCode(val);
                  }
                }),
          ],
        ),
        body: FutureBuilder<List<ForecastModel>>(
          future: ForecastViewModel().getForecast(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("No Data Found"),
              );
            }
            if (snapshot.hasError || snapshot.data == null) {
              return const Center(
                child: Text(
                  "Something Error\nTry Again Later",
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return Background(
                weather: snapshot.data.weather.weather,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder(
                          future: ForecastViewModel().getLocation(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          }),
                      FutureBuilder<String>(
                          future: ForecastViewModel().getLastUpdateTime(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          }),
                      const SizedBox(height: 10),
                      Text(
                        "${languageMap[language.languageCode]!["minTemp"]}: ${snapshot.data![0].temperature.minTemp.toStringAsFixed(2)} \u2103",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${languageMap[language.languageCode]!["maxTemp"]}: ${snapshot.data![0].temperature.maxTemp.toStringAsFixed(2)} \u2103",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${languageMap[language.languageCode]!["feelsLike"]}: ${snapshot.data![0].temperature.feelsLike.toStringAsFixed(2)} \u2103",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        snapshot.data![0].weather.weather,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        snapshot.data![0].weather.description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(snapshot.data[index].date),
                                  Text(
                                    "Min Temp: ${snapshot.data![index].temperature.minTemp.toStringAsFixed(2)} \u2103",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Max Temp: ${snapshot.data![index].temperature.maxTemp.toStringAsFixed(2)} \u2103",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Feels like: ${snapshot.data![index].temperature.feelsLike.toStringAsFixed(2)} \u2103",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
              );
            }
          },
        ),
      );
    });
  }
}
