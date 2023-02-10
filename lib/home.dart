import 'package:flutter/material.dart';
import 'package:weather_app/model_class.dart';
import 'package:weather_app/request&response_model_class.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  WeatherData wd=new WeatherData();
  Weather w=new Weather();

  String climate='';
  String day='';
  double temp=0;
  double farn=0;

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  void getWeather() async {
    w=await wd.getWeatherData("kozhikode");

    setState(() {
      temp=w.degree;
      day=w.date;
      farn=w.farenheat;
      climate=w.condition;

      print(w.degree);
      print(w.date);
      print(w.farenheat);
      print(w.condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.maxFinite,
        decoration: BoxDecoration(image: DecorationImage(
          image: AssetImage("images/back_weath.jpg"),fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("KOZHIKODE",style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 8,
                    wordSpacing: 20,
                  )
                  ),

                  Text("$day",style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 8,
                    wordSpacing: 20,
                  )
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                          Icons.wb_cloudy,
                          size: 45,color:Colors.black,
                      ),
                      Text("$climate",style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 4,
                        wordSpacing: 5,
                      )
                      ),
                    ],
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.thermostat,
                        size: 45,color:Colors.black,
                      ),
                      Text("${farn.toString()}°F",style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 4,
                      )
                      ),
                    ],
                  ),
                ],
              ),
              Text("${temp.toString()}°C",style: TextStyle(
                fontSize: 80,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                letterSpacing: 8,
                wordSpacing: 20,
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
