class Event {
  int id; //"id": "266245538",
  String name; //"name": "Flutter Interact @ Google for Startups",
  int yes_rsvp_count; // "yes_rsvp_count": 80,

  Event(int id, String name, int yes_rsvp_count) {
    this.id = id;
    this.name = name;
    this.yes_rsvp_count = yes_rsvp_count;
  }

  Event.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        yes_rsvp_count = json['yes_rsvp_count'];

  Map toJson() {
    return {'id': id, 'name': name, 'yes_rsvp_count': yes_rsvp_count};
  }

}
