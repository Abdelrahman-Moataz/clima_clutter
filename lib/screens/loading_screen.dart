import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(LocationWeather: weatherData,);
    }));
  }


    @override
    Widget build(BuildContext context) {

      String myMargin = '15';
      double myMarginAsADouble;

      try {
        myMarginAsADouble = double.parse(myMargin);
      }
      catch (e) {
        print(e);
      }

      return SafeArea(
        child: Scaffold(body: Center(child: SpinKitDoubleBounce(color: Colors.white,size: 100.0,),),),

      );
    }
  }
