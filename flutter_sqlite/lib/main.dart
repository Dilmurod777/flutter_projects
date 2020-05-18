import 'package:flutter/material.dart';

import './database_helper.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqflite Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () async {
                int insertedId = await DatabaseHelper.instance
                    .insert({DatabaseHelper.columnName: "Dilmurod"});

                print("Inserted row index: $insertedId");
              },
              child: Text('insert'),
              color: Colors.green,
            ),
            FlatButton(
              onPressed: () async {
                List<Map<String, dynamic>> data =
                    await DatabaseHelper.instance.queryAll();

                print(data);
              },
              child: Text('query'),
              color: Colors.blueGrey,
            ),
            FlatButton(
              onPressed: () async {
                int affectedRowsNumber = await DatabaseHelper.instance.update({
                  DatabaseHelper.columnId: 2,
                  DatabaseHelper.columnName: 'Mustafo',
                });

                print("Affected rows numbers: $affectedRowsNumber");
              },
              child: Text('update'),
              color: Colors.blueAccent,
            ),
            FlatButton(
              onPressed: () async{
                int totalRowNumber = (await DatabaseHelper.instance.queryAll())[0][DatabaseHelper.columnId];
                int affectedRowsNumber = await DatabaseHelper.instance.delete(totalRowNumber);

                print('Affected rows number: $affectedRowsNumber');
              },
              child: Text('delete'),
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}
