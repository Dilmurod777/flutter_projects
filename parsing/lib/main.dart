import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import 'package:parsing/string_formatter.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyHomePage(title: "Parser"));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    print("Started");

    List<String> profileIds = [];
    List<Map<String, dynamic>> profiles = [];

    // 6710
    try {
      for (int i = 676; i < 6710; i++) {
        print("$i | ${profiles.length}");

        http.Response response = await http.post(
            'https://bdsmpeople.club/search/index.php?input_action=search&input_who1=2&input_who2=0&input_bdsm_position=0&input_age1=18&input_age2=99&input_country_id=0&input_state_id=0&input_city_id=0&input_with_photo=on&o=${i * 10}');

        var document = parse(decodeCp1251(response.body));
        var currentEls = document.body.children[1]
            .getElementsByClassName('uni_padding')
            .first
            .getElementsByClassName('text_normal');
        var currentEl;

        if (currentEls.length > 0) {
          currentEl = currentEls.first;
          int total = int.parse(currentEl.text.split(' ')[1]);

          int profilesOnPage = 10;

          profileIds = [];
          for (var i = 0; i < profilesOnPage; i++) {
            currentEl = currentEl.nextElementSibling.nextElementSibling;

            profileIds.add(currentEl.children[0].children[0].children[1]
                .children[0].children[0].attributes['href']
                .split('/')[2]);
          }

          for (var id in profileIds) {
            response = await http.post('https://bdsmpeople.club/personal/$id/');
            document = parse(decodeCp1251(response.body));

            var uniPadding = document.body.children[1]
                .getElementsByClassName('uni_padding')
                .first;

            var photos = uniPadding.children[0].children[0].children[0]
                .children[0].children[1].children[0].children[0];
            var mainDetails =
                uniPadding.children[0].children[0].children[0].children[1];
            var secondaryDetails = uniPadding.children[7];

            var osnovnoe = '';
            var o_sebe = '';
            var interests_v_teme = '';
            var tabu = '';
            var position_v_teme = '';
            var partner = '';

            var titles =
                secondaryDetails.getElementsByClassName('text_info_title');
            var values =
                secondaryDetails.getElementsByClassName('text_info_item');

            for (var title in titles) {
              int index = titles.indexOf(title);
              switch (title.text) {
                case 'Основное':
                  osnovnoe = values[index].text;
                  break;
                case 'О себе':
                  o_sebe = values[index].text;
                  break;
                case 'Табу':
                  tabu = values[index].text;
                  break;
                case 'Интересы в Теме':
                  interests_v_teme = values[index].text;
                  break;
                case 'Позиционирование в Теме':
                  position_v_teme = values[index].text;
                  break;
                case 'Партнером может стать':
                  partner = values[index].text;
                  break;
                default:
                  break;
              }
            }

            Map<String, dynamic> profile = {
              'id': id,
              'firstname': mainDetails.children[0].text,
              'sex': 'female',
              'appinfo': {
                'address': mainDetails.children[1].text,
                'age': int.parse(mainDetails.children[2].text.split(' ')[1]),
                'osnovnoe': osnovnoe,
                'o_sebe': o_sebe,
                'interest_v_teme': interests_v_teme,
                'tabu': tabu,
                'positionType': position_v_teme,
                'partnerTypes': partner.split(','),
              },
              'photos': photos.children
                  .map(
                    (photo) => {
                      'url':
                          "https://bdsmpeople.club${photo.getElementsByTagName('img').first.attributes['src']}"
                    },
                  )
                  .toList(),
            };

            profiles.add(profile);
          }
        }
      }
    } catch (error) {
      print("Error: $error");
    } finally {
      print("Writing to file");
      writeToFile(jsonEncode(profiles)).then((value) {
        print("Finished");
      });
    }
  }

  Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print(path);
    return File('$path/female_data2.json');
  }

  Future<File> writeToFile(String json) async {
    final file = await _localFile;

    // Write the file.
    return file.writeAsString(json);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
