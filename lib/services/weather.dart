import '/services/location.dart';

import 'networking.dart';

class WeatherModel {
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



  Future<dynamic> getLocation() async{
    try{
      Location location = Location();
      await location.getCurrentLocation();

      NetworkHelper net = NetworkHelper();
      var data = await net.getWeatherData(location);
      return data;
    }catch(e){
      print(e);
    }
  }


  Future<dynamic> getCityWeather(String cityName) async{
    try{

      NetworkHelper net = NetworkHelper();
      var data = await net.getCityWeatherData(cityName);
      return data;
    }catch(e){
      print(e);
    }
  }
}
