import 'package:flutter/material.dart';

class News {
  DateTime? dt;
  String? title;
  String? text;
  News([this.dt, this.title, this.text]);
}

class _CardWidgetState extends State<CardWidget> {

  List<News> listNews = [
    News(DateTime(2021, 1, 1), "Mass shooting in Atlanta",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit Proin sit ame"),
    News(DateTime(2021, 2, 2), "Carnival clown found drunk in Misisippi",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit Proin sit ame"),
    News(DateTime(2021, 3, 3), "Walrus found in family pool in Florida",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit Proin sit ame"),
  ];
  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = listNews.map((e) => NewsCard(e)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Widget"),
      ),
      body: ListView(
        children: listWidget,
      ),
    );
  }
}
class CardWidget extends StatefulWidget {
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class NewsCard extends StatelessWidget {
  News? news;
  NewsCard([this.news]);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('img/bbc.png'),
            // duong dan anh
            Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                    '${news?.dt?.day}/${news?.dt?.month}/${news?.dt?.year}')),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                '${news?.title}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text('${news?.text}')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    onPressed: onPressedShare, child: Text("Share")),
                FloatingActionButton(
                    onPressed: onPressedBookmark, child: Text("Bookmark")),
                FloatingActionButton(
                    onPressed: onPressedLink, child: Text("Link")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onPressedShare() {}

  void onPressedBookmark() {}

  void onPressedLink() {}
}
