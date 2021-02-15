import 'package:flutter/material.dart';
import 'package:muzic/common/data.dart';
import 'package:muzic/common/events.dart';

import 'components/artist_body/artist_body.dart';

class ArtistScreen extends StatefulWidget {
  @override
  _ArtistScreenState createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            eventBus.fire(HomeInnerPageChangeEvent(goBack: true));
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Artist Details',
          style: TextStyle(
            fontFamily: 'CircularStd',
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {},
              child: Icon(
                Icons.search,
                color: Colors.white.withOpacity(0.35),
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: ArtistBody(),
    );
  }
}
