import 'post.dart';

class AstronautList {
  int number;
  List<Astronaut> astronauts;

  AstronautList({this.number, this.astronauts});

  AstronautList.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    if (json['people'] != null) {
      astronauts = new List<Astronaut>();
      json['people'].forEach((v) {
        astronauts.add(new Astronaut.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    if (this.astronauts != null) {
      data['people'] = this.astronauts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
