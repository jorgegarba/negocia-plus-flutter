class AdvertisingSpace {
  int id;
  String title;
  String description;
  Object oferts;
  Object image;
  AdvertisingSpace(
      {this.id, this.oferts, this.image, this.title, this.description});

  factory AdvertisingSpace.fromJson(Map<String, dynamic> parsedJson) {
    return AdvertisingSpace(
      id: parsedJson['espacioId'],
      title: parsedJson['espacioTit'],
      description: parsedJson['espacioDesc'],
      oferts: parsedJson['espaciosOferta'],
      image: parsedJson['imagen'],
    );
  }
}
