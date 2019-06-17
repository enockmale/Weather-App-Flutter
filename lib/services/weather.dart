import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = 'd3b11b7056a00553194d5f143d5e643e';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?q=$cityName&units=metric&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    print('getting location...');

//    Location location = Location();
//    await location.getCurrentLocation();
//    latitude = location.latitude;
//    longitude = location.longitude;

    //testing coordinates for kampala, uganda
    double latitude = 0.31628;
    double longitude = 32.58219;

//    //testing for berlin, germany
//    latitude = 52.520008;
//    longitude = 13.404954;

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
