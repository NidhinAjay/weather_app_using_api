import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/model_class.dart';

class WeatherData{
  Future<Weather> getWeatherData(String place) async{
    try{
      final keyvalue={
        // 263ba36ca9d541eda2370444230102
        'key':'263ba36ca9d541eda2370444230102',
        'q':place,
      };
      final uri=Uri.http('api.weatherapi.com','/v1/current.json',keyvalue);
      final response=await http.get(uri);
      if(response.statusCode==200){
        return Weather.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception("can't fetch");
      }
    }
    catch(e){
      rethrow;
    }
  }
}