class Weather{
  double degree;
  double farenheat;
  String condition;
  String date;
  Weather({
  this.degree=0,
  this.farenheat=0,
  this.condition="sunny",
    this.date="hj"
});
  factory Weather.fromJson(Map<String,dynamic> json){
    return Weather(
        degree:json["current"]["temp_c"],
        farenheat:json["current"]["temp_f"],
        condition:json["current"]["condition"]["text"],
      date:json["location"]["localtime"],
    );
  }
}