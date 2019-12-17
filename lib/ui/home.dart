import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:sorteio_meetup/model/user.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.playTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sorteio Meetup",style: GoogleFonts.pacifico()),
      ),
      body: mainBody(),
      floatingActionButton: fab(),
    );
  }

  Container mainBody() {
    return Container(
      child: listObjects(),
    );
  }

  FloatingActionButton fab() {
    return FloatingActionButton(
      tooltip: 'Sort',
      child: Icon(Icons.sync),

    );
  }

  ListView listObjects() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: _getImagem(users[index].email),
          title: Text(users[index].name),
          subtitle: Text(users[index].email),
        );
      },
    );
  }

  _getImagem(String email) {
    String hash = textToMd5(email.toLowerCase());
    return Image.network("https://www.gravatar.com/avatar/" + hash+"?d=robohash");

  }

  String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }
}
