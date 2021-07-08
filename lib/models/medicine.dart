class Medicines {
  final String name;
  final String time;
  final String interval;

  Medicines({this.name, this.time, this.interval});

  Map<String, dynamic> toJson() => {
        'name': name,
        'time': time,
        'interval': interval,
      };

  Medicines.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        time = json['time'],
        interval = json['interval'];
}
