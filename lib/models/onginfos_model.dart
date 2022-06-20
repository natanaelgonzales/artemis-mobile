class Ongsinfo {
  String name;
  String description;
  String email;
  String telephone;

  Ongsinfo({
    this.name,
    this.description,
    this.email,
    this.telephone
  });

  factory Ongsinfo.fromJson(Map<String, dynamic> parsedJson){

    return Ongsinfo(
      name: parsedJson['name'],
      description : parsedJson['description'],
      email: parsedJson['email'],
      telephone: parsedJson['telephone'],
    );
  }
}
