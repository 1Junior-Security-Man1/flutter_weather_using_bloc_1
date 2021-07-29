class Main {
  Main({
    this.temp,
    this.tempMin,
    this.tempMax,
  });

  double temp;
  double tempMin;
  double tempMax;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"].toDouble(),
    tempMin: json["temp_min"].toDouble(),
    tempMax: json["temp_max"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "temp_min": tempMin,
    "temp_max": tempMax,
  };
}

class Weather {
  Weather({
    this.icon,
  });

  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
  };
}