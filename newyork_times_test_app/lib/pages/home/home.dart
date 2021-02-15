import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:newyork_times_test_app/data/common.dart';
import 'package:newyork_times_test_app/helpers/date_time_formatter.dart';
import 'package:newyork_times_test_app/models/NewsItem.dart';
import 'package:newyork_times_test_app/pages/home/components/news_card/news_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  List<NewsItem> news = [];

  @override
  void initState() {
    fetchNews();

    super.initState();
  }

  Future fetchNews() async {
    setState(() {
      _isLoading = true;
    });

    if (lastUpdatedNewsDate == null ||
        lastUpdatedNewsDate != dateTimeFormatter(DateTime.now())) {
      final response =
          await http.get("$NewYorkTimesURL?api-key=$NewYorkTimesApiKey");

      if (response.statusCode == 200) {
        for (var item in jsonDecode(response.body)['results']) {
          news.add(NewsItem(item));
        }

        prefs.setString('news', jsonEncode(news));
        prefs.setString(
          'lastUpdatedNewsDate',
          dateTimeFormatter(DateTime.now()),
        );

        lastUpdatedNewsDate = dateTimeFormatter(DateTime.now());
      }
    } else {
      news = jsonDecode(prefs.getString('news'));
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          'Top Stories',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                strokeWidth: 1,
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
              itemBuilder: (context, index) => NewsCard(data: news[index]),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: news.length,
            ),
    );
  }
}
