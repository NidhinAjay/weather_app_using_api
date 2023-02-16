import 'package:flutter/material.dart';
import 'package:weather_app/model_class.dart';
import 'package:weather_app/request&response_model_class.dart';
import 'package:intl/intl.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  WeatherData wd = new WeatherData();
  Weather w = new Weather();

  String climate = '';
  double temp = 0;
  double farn = 0;
  String AMimage = "images/bg_1.jpg";
  String AMimage1 = "images/bg_2.jpg";
  String PMimage = "images/bg_3.jpg";
  String PMimage1 = "images/bg_4.jpg";
  String image = "";
  String place = "kozhikode";
  String sthalam = 'kozhikode';
  String rajyam = 'india';
  int humidit=0;
  double winnd=0;
  double lati=0;
  double long=0;
  String iCon = "";
  // double maxtemp = 0;
  // double mintemp = 0;


  @override
  String bgimage() {
    var hour = DateTime.now().hour;
    if ((hour >= 6)&&(hour < 11)) {
      image = AMimage;
    } else if ((hour >= 11)&&(hour < 15)){
      image = AMimage1;
    }else if ((hour >= 15)&&(hour < 19)){
      image = PMimage;
    }else {
      image = PMimage1;
    }
    return image;
  }

  void initState() {
    super.initState();
    getWeather();
  }

  void getWeather() async {
    w = await wd.getWeatherData("$place");

    setState(() {
      temp = w.degree;
      farn = w.farenheat;
      climate = w.condition;
      sthalam = w.Place;
      rajyam = w.country;
      lati=w.lat;
      long=w.lon;
      winnd=w.wind;
      humidit=w.humidity;
      iCon=w.icon;
      // maxtemp=w.maxdegree;
      // mintemp=w.mindegree;

      print(w.Place);
      print(w.country);
      print(w.degree);
      print(w.farenheat);
      print(w.condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(bgimage()), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder(
                      stream: Stream.periodic(Duration(seconds: 1)),
                      builder: (context, snapshot) {
                        return Text(
                            "${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}:${DateTime.now().second.toString()}",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 5,
                              wordSpacing: 13,
                            ));
                      }
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text(DateFormat.yMMMEd().format(DateTime.now()),
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,

                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: TextField(
                      onChanged: (value){
                        setState(() {
                          place=value;
                          getWeather();
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.camera_alt_outlined),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black, width: 2)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        label: Text("Enter a Place"),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                          hintText: "Search"
                      ),
                    ),
                  ),

                  Text("$sthalam".toUpperCase(),
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 8,
                        wordSpacing: 20,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text("$rajyam".toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          wordSpacing: 3,
                        )),
                  ),
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${temp.toString()}°c",
                      style: TextStyle(
                        fontSize: 80,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 8,
                        wordSpacing: 4,
                      )),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text("${maxtemp.toString()}°c | ${mintemp.toString()}°c",
                      //     style: TextStyle(
                      //       fontSize: 15,
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.w700,
                      //       letterSpacing: 4,
                      //       wordSpacing: 2,
                      //     )),

                    ],),
                  SizedBox(height: 5,),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Text("$climate",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 4,
                          wordSpacing: 5,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child:
                      // Icon(
                      //   Icons.wb_cloudy,
                      //   size: 30,
                      //   color: Colors.black,
                      // ),
                      Image.network("http:$iCon")
                    ),
                  ],)
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(width: 15,),
                        Text("${lati.toString()}°,${long.toString()}°",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                            )),
                      ],),
                      SizedBox(height: 5,),
                      Row(children: [
                        Icon(
                          Icons.air,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(width: 15,),
                        Text("${winnd.toString()} kph",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                          )),
                        ],),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text("${farn.toString()}°F",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2,
                              )),
                          SizedBox(width: 10,),
                          Icon(
                            Icons.thermostat,
                            size: 30,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),

                      Row(
                        children: [
                          Text("${humidit.toString()} %",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2,
                              )),
                          SizedBox(width: 10,),
                          Icon(
                            Icons.water_drop,
                            size: 30,
                            color: Colors.black,
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
