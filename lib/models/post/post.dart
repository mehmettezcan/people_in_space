class Astronaut {
  String name;
  String biophoto;
  int biophotowidth;
  int biophotoheight;
  String country;
  String countryflag;
  String launchdate;
  int careerdays;
  String title;
  String location;
  String bio;
  String biolink;
  String twitter;

  Astronaut(
      {this.name,
        this.biophoto,
        this.biophotowidth,
        this.biophotoheight,
        this.country,
        this.countryflag,
        this.launchdate,
        this.careerdays,
        this.title,
        this.location,
        this.bio,
        this.biolink,
        this.twitter});

  Astronaut.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    biophoto = json['biophoto'];
    biophotowidth = json['biophotowidth'];
    biophotoheight = json['biophotoheight'];
    country = json['country'];
    countryflag = json['countryflag'];
    launchdate = json['launchdate'];
    careerdays = json['careerdays'];
    title = json['title'];
    location = json['location'];
    bio = json['bio'];
    biolink = json['biolink'];
    twitter = json['twitter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['biophoto'] = this.biophoto;
    data['biophotowidth'] = this.biophotowidth;
    data['biophotoheight'] = this.biophotoheight;
    data['country'] = this.country;
    data['countryflag'] = this.countryflag;
    data['launchdate'] = this.launchdate;
    data['careerdays'] = this.careerdays;
    data['title'] = this.title;
    data['location'] = this.location;
    data['bio'] = this.bio;
    data['biolink'] = this.biolink;
    data['twitter'] = this.twitter;
    return data;
  }
}
