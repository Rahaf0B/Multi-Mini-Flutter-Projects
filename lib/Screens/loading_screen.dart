
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '/Screens/location_screen.dart';
import '/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async{


WeatherModel model=WeatherModel();
var data=await model.getLocation();
if (context.mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
       locationWeather:data
        );
      }));
    }
  }

  @override
  void initState() {

    // TODO: implement initState
    getLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
      body: Center(
       child: SpinKitDoubleBounce(

         color: Colors.white,
         size: 100,
       ),
        ),
    );
  }
}
