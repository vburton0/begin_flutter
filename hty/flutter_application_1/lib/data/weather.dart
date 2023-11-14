class Weather{
  String name = '';  //Transform a Json string into data
  String description = '';
  double temperature = 0;
  double perceived = 0;
  int pressure = 0;
  int humidity = 0;

  Weather(this.name, this.description, 
  this.temperature, this.perceived, this.pressure, this.humidity);

  Weather.fromJson(Map<String, dynamic> weatherMap){
    this.name = weatherMap['name'];
    this.temperature = (weatherMap['main']['temp'] - 273.15) ?? 0; //le ?? 0 sert dans le cas ou c'est NULL
    this.perceived = (weatherMap['main']['feels_like'] - 273.15) ?? 0; //le ?? 0 sert dans le cas ou c'est NULL
    this.pressure = weatherMap['main']['pressure'] ?? 0;
    this.humidity = weatherMap['main']['humidity'] ?? 0;
    this.description = weatherMap['weather'][0]['main'] ?? '';
  }
}