class Prediction {
  int? id;
  String CarName;
  String fueltype;
  String aspiration;
  String doornumber;
  String carbody;
  String drivewheel;
  String enginelocation;
  String enginetype;
  String cylindernumber;
  String fuelsystem;
  int symboling;
  int wheelbase;
  int carlength;
  int carwidth;
  int carheight;
  int curbweight;
  int enginesize;
  int boreratio;
  int stroke;
  int compressionratio;
  int horsepower;
  int peakrpm;
  int citympg;
  int highwaympg;
  Prediction({
    this.id,
    required this.CarName,
    required this.fueltype,
    required this.aspiration,
    required this.doornumber,
    required this.carbody,
    required this.drivewheel,
    required this.enginelocation,
    required this.enginetype,
    required this.cylindernumber,
    required this.fuelsystem,
    required this.symboling,
    required this.wheelbase,
    required this.carlength,
    required this.carwidth,
    required this.carheight,
    required this.curbweight,
    required this.enginesize,
    required this.boreratio,
    required this.stroke,
    required this.compressionratio,
    required this.horsepower,
    required this.peakrpm,
    required this.citympg,
    required this.highwaympg,
  });
  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      id: json["id"],
      CarName: json["CarName"],
      fueltype: json["fueltype"],
      aspiration: json["aspiration"],
      doornumber: json["doornumber"],
      carbody: json["carbody"],
      drivewheel: json["drivewheel"],
      enginelocation: json["enginelocation"],
      enginetype: json["enginetype"],
      cylindernumber: json["cylindernumber"],
      fuelsystem: json["fuelsystem"],
      symboling: json["symboling"],
      wheelbase: json["wheelbase"],
      carlength: json["carlength"],
      carwidth: json["carwidth"],
      carheight: json["carheight"],
      curbweight: json["curbweight"],
      enginesize: json["enginesize"],
      boreratio: json["boreratio"],
      stroke: json["stroke"],
      compressionratio: json["compressionratio"],
      horsepower: json["horsepower"],
      peakrpm: json["peakrpm"],
      citympg: json["citympg"],
      highwaympg: json["highwaympg"],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'CarName': CarName,
        'fueltype': fueltype,
        'aspiration': aspiration,
        'doornumber': doornumber,
        'carbody': carbody,
        'drivewheel': drivewheel,
        'enginelocation': enginelocation,
        'enginetype': enginetype,
        'cylindernumber': cylindernumber,
        'fuelsystem': fuelsystem,
        'symboling': symboling,
        'wheelbase': wheelbase,
        'carlength': carlength,
        'carwidth': carwidth,
        'carheight': carheight,
        'curbweight': curbweight,
        'enginesize': enginesize,
        'boreratio': boreratio,
        'stroke': stroke,
        'compressionratio': compressionratio,
        'horsepower': horsepower,
        'peakrpm': peakrpm,
        'citympg': citympg,
        'highwaympg': highwaympg,
      };
}
