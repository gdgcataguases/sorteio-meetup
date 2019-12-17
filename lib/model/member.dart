class Member {

  int id; //"id": "266245538",
  String name; //"name": "Flutter Interact @ Google for Startups",
  String photoThumbLink;

  Member(int id, String name, String photoThumbLink) {
    this.id = id;
    this.name = name;
    this.photoThumbLink = photoThumbLink;
  }

  Member.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        photoThumbLink = json['email'];



//"id": 248512731,
//"name": "Aldebaran Nascimento",
//"photo": {"thumb_link": }

}
