import 'package:intl/intl.dart';
import 'package:weather_forecast/model/city_model.dart';
import 'package:weather_forecast/model/forecast_model.dart';
import 'package:weather_forecast/services/api.dart';
import 'package:weather_forecast/services/geo_location.dart';
import 'package:weather_forecast/services/spf.dart';
import 'package:weather_forecast/utils/app_utils.dart';

class ForecastViewModel {
  Future<List<ForecastModel>> getForecast() async {
    final format = DateFormat("dd-MM-yyyy hh:mm a");
    List<ForecastModel> forecastModel = [];
    await SpfService().getLastUpdate().then((value) async {
      if (value != null &&
          DateTime.now().difference(DateTime.parse(value)).inDays < 1) {
        AppUtils.lastUpdateTime = format.format(DateTime.parse(value));
        forecastModel = await SpfService().getForecastData();
      } else {
        AppUtils.lastUpdateTime = format.format(DateTime.now());
        forecastModel = await hitResponse();
      }
    });
    return forecastModel;
  }

  Future<List<ForecastModel>> hitResponse() async {
    List<ForecastModel> forecastModel = [];
    await GeoLocationService().getCurrentLocation().then((location) async {
      await ApiServices()
          .getWeatherForecast(lat: location.lat, lng: location.lng)
          .then((mapData) {
        if (mapData != null) {
          for (Map<String, dynamic> map in mapData["list"]) {
            forecastModel.add(ForecastModel.fromJson(map));
          }
          CityModel.city = mapData["city"]["name"];
          CityModel.country = mapData["city"]["country"];
          SpfService().saveLocation("${CityModel.city}, ${CityModel.country}");
          SpfService().saveForecastData(forecastModel);
        }
      });
    });

    return forecastModel;
  }

  //Get Update Date Time
  Future<String> getLastUpdateTime() async {
    String lastUpdateTime = "";

    return lastUpdateTime;
  }

  // Get Location
  Future<String> getLocation() async {
    return await SpfService().getLocation();
  }
}
