/// coord : {"lon":-122.084,"lat":37.422}
/// weather : [{"id":711,"main":"Smoke","description":"smoke","icon":"50d"}]
/// base : "stations"
/// main : {"temp":17.41,"feels_like":17.35,"temp_min":14.13,"temp_max":20.17,"pressure":1011,"humidity":82}
/// visibility : 10000
/// wind : {"speed":0,"deg":0}
/// clouds : {"all":90}
/// dt : 1629477162
/// sys : {"type":1,"id":5122,"country":"US","sunrise":1629466149,"sunset":1629514467}
/// timezone : -25200
/// id : 5375480
/// name : "Mountain View"
/// cod : 200

class Main {
  MainObject _main;

  MainObject get main => _main;

  Main({
    MainObject main,
  }){

    _main = main;
}

  Main.fromJson(dynamic json) {
    _main = json['main'] != null ? MainObject.fromJson(json['main']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   var map = <String, dynamic>{};
  //   if (_main != null) {
  //     map['main'] = _main.toJson();
  //   }
  //   return map;
  // }

}

class MainObject {
  double _temp;
  double _tempMin;
  double _tempMax;

  double get temp => _temp;
  double get tempMin => _tempMin;
  double get tempMax => _tempMax;

  MainObject({
      double temp, 
      double tempMin,
      double tempMax, 
  }){
    _temp = temp;
    _tempMin = tempMin;
    _tempMax = tempMax;
}

  MainObject.fromJson(dynamic json) {
    _temp = json['temp'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
  }

  // Map<String, dynamic> toJson() {
  //   var map = <String, dynamic>{};
  //   map['temp'] = _temp;
  //   map['temp_min'] = _tempMin;
  //   map['temp_max'] = _tempMax;
  //   return map;
  // }
}