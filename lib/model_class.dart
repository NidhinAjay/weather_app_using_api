class Weather {
  double degree;
  double farenheat;
  String condition;
  String Place;
  String country;
  int humidity;
  double wind;
  double lat;
  double lon;
  String icon;
  // double maxdegree;
  // double mindegree;

  Weather(
      {this.degree = 0,
      this.farenheat = 0,
      this.condition = "sunny",
      this.Place = "kozhikode",
      this.country = "india",
      this.lon = 0,
      this.lat = 0,
      this.wind = 0,
      this.humidity = 0,
        this.icon=""
      // this.maxdegree = 0,
      // this.mindegree = 0
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      degree: json["current"]["temp_c"],
      farenheat: json["current"]["temp_f"],
      icon: json["current"]["condition"]["icon"],
      condition: json["current"]["condition"]["text"],
      Place: json["location"]["name"],
      country: json["location"]["country"],
      lat: json["location"]["lat"],
      lon: json["location"]["lon"],
      wind: json["current"]["wind_kph"],
      humidity: json["current"]["humidity"],
      // maxdegree: json["forecast"]["forecastday"]["day"]["maxtemp_c"],
      // mindegree: json["forecast"]["forecastday"]["day"]["mintemp_c"],
    );
  }
}
