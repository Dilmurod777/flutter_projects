import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:unsplash_gallery/screens/home/components/single_image.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;
  List<dynamic> images = [];
  int page = 0;
  ScrollController _scrollController;

  fetchImages() async {
    if (images.length == 0) {
      this.setState(() {
        isLoading = true;
      });
    }

    var url =
        'https://api.unsplash.com/photos?client_id=rZc6k6BeYuhUYd6d1Oy7QCLeTysNosf33NTiOOgFQRU&page=${page + 1}&orderBy=popular';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      this.setState(() {
        if (images.length == 0) {
          images = jsonDecode(response.body);
        } else {
          images = [...images, ...jsonDecode(response.body)];
        }
        isLoading = false;
        page = page + 1;
      });
    }
  }

  fetchMoreImages() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      fetchImages();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(fetchMoreImages);

    fetchImages();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (context, index) => SingleImage(
              image: images[index],
            ),
          );
  }
}
