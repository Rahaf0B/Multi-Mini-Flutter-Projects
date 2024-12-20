import 'dart:convert';
import 'package:http/http.dart' as http;
import '/services/location.dart';

class NetworkHelper {
  String _apiKey = "110a420201ad30cc1882a56c6bd1b0b8";

  Future getWeatherData(Location location) async {
    try{

      double lat=location.latitude!;
      double lon=location.longitude!;
      var url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$_apiKey&units=metric");
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var body = response.body;
        var data = json.decode(body);
        return data;
      }else{
        print("Error ${response.statusCode} ");
      }
    }catch(e){
      print(e);
    }
  }


  Future getCityWeatherData( String cityName) async {
    try{

      var url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$_apiKey&units=metric");
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var body = response.body;
        var data = json.decode(body);
        return data;
      }else{
        print("Error ${response.statusCode} ");
      }
    }catch(e){
      print(e);
    }
  }
}
