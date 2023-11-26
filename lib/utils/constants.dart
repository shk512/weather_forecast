//++++++++++++++ IMAGE PATHS +++++++++++++++++++++++++++++
const cloudy = "assets/images/cloudy.jpg";
const rainy = "assets/images/rainy.jpg";
const stormy = "assets/images/stormy.jpg";
const sunny = "assets/images/sunny.jpg";
const snow = "assets/images/snow.jpg";
const clear = "assets/images/clear.jpg";

//+++++++++++++++++++++ API KEY +++++++++++++++++++++++++++++
const weatherApiKey = "979b9c814b1159ab30fb20a8f07b0034";

Map<String, Map<String, String>> languageMap = {
  "en": {
    "weatherForecast": "Weather Forecast",
    "minTemp": "Min Temp",
    "maxTemp": "Max Temp",
    "feelsLike": "Feels Like"
  },
  "ar": {
    "weatherForecast": "النشرة الجوية",
    "minTemp": "الحد الأدنى لدرجة الحرارة",
    "maxTemp": "أقصى درجة حرارة",
    "feelsLike": "أحس كأنني"
  }
};
