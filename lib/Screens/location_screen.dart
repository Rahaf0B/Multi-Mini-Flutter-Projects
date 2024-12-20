import 'package:flutter/material.dart';
import '/Screens/city_screen.dart';
import '/services/weather.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
  final locationWeather;

  LocationScreen({required this.locationWeather});
}

class _LocationScreenState extends State<LocationScreen> {
  late String icon;
  late String msg;
  late int temp;
  WeatherModel weather = WeatherModel();
  late String cityName;
  void updateUI(dynamic data) {
    setState(() {
      if (data == null) {
        temp = 0;
        icon = 'Error';
        msg = "Unable To Get Data";
        cityName = '';
        return;
      }

      double t = data["main"]["temp"];
      temp = t.toInt();
      int condition = data["weather"][0]["id"];
      icon = weather.getWeatherIcon(condition);
      msg = weather.getMessage(temp);
      cityName = data["name"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var data = await weather.getLocation();
                      updateUI(data);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var cityName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));

                      if (cityName != null) {
                        var data = await weather.getCityWeather(cityName);
                        updateUI(data);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        '$temp°',
                        style: kTempTextStyle,
                      ),
                    ),
                    Text(
                      icon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  msg + " in " + cityName,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
