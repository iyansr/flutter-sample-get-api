import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardAlbum extends StatelessWidget {
  final String imageTitle;
  final String cardTitle;
  final String cardSubtitle;
  final String thumbImage;
  final String urlLaunch;

  CardAlbum({
    this.imageTitle,
    this.cardSubtitle,
    this.cardTitle,
    this.thumbImage,
    this.urlLaunch,
  });

  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      String url = this.urlLaunch;
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Container(
                height: 48,
                width: 48,
                child: Image.network(this.imageTitle),
              ),
              title: Text(this.cardTitle),
              subtitle: Text(this.cardSubtitle),
            ),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(this.thumbImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                child: OutlineButton(
                  borderSide: BorderSide(color: Colors.blue),
                  onPressed: _launchURL,
                  child: Text('Buy'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
