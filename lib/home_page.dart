import 'package:app_test_api/widget/card.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List dataJson;

  var api = "https://rallycoding.herokuapp.com/api/music_albums";

  Future<String> getData() async {
    http.Response hasil = await http
        .get(Uri.encodeFull(api), headers: {"Accept": "application/json"});

    this.setState(() {
      dataJson = jsonDecode(hasil.body);
    });

    return 'Succes';
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    Future<String> cardModel = getData();

    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<String>(
        future: cardModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: dataJson == null ? 0 : dataJson.length,
              itemBuilder: (context, index) {
                return CardAlbum(
                  cardTitle: dataJson[index]['title'],
                  cardSubtitle: dataJson[index]['artist'],
                  imageTitle: dataJson[index]['thumbnail_image'],
                  thumbImage: dataJson[index]['image'],
                  urlLaunch: dataJson[index]['url'],
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
