import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_forecast/view/screens/weather_forecast_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!await Permission.location.isGranted) {
    await Permission.location.request();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const WeatherForecastScreen(),
    );
  }
}
