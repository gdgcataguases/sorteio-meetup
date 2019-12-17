import 'package:http/http.dart' as http;

class API {
  static const baseUrl = "https://jsonplaceholder.typicode.com";
  static const MEETUP_CHAPTER_URLNAME = "GDG-Cataguses";

  static const BASE_URL = "https://api.meetup.com/" + MEETUP_CHAPTER_URLNAME;

  static Future getUsers() {
    var url = baseUrl + "/users";
    return http.get(url);
  }

  static Future getEvents() {
    var url = BASE_URL + "/events";
    return http.get(url);
  }

}