import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;
import 'dart:convert';

import './coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String convertedBTC = '?';
  String convertedETH = '?';
  String convertedLTC = '?';
  bool loadingBTC = true;
  bool loadingETH = true;
  bool loadingLTC = true;

  // Android Version
  DropdownButton<String> getDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      dropdownItems.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        updateUI(value);
      },
    );
  }

  // iOS Version
  CupertinoPicker getCupertinoPicker() {
    List<Text> dropdownItems = [];

    for (String currency in currenciesList) {
      dropdownItems.add(
        Text(
          currency,
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        updateUI(currenciesList[selectedIndex]);
      },
      children: dropdownItems,
    );
  }

  Future<String> getConvertedCurrency(String crypto) async {
    http.Response rawData = await http
        .get('$APIUrl?fsym=$crypto&tsyms=$selectedCurrency&api_key=$APIKey');
    dynamic decodedData = jsonDecode(rawData.body);

    return decodedData[selectedCurrency].toString();
  }

  void updateUI(String value) async {
    setState((){ 
      selectedCurrency = value;
      loadingBTC = true;
      loadingETH = true;
      loadingLTC = true;
    });
    
    String btc = await getConvertedCurrency('BTC');
    String eth = await getConvertedCurrency('ETH');
    String ltc = await getConvertedCurrency('LTC');
    setState(() {
      convertedBTC = btc;
      convertedETH = eth;
      convertedLTC = ltc;
      loadingBTC = false;
      loadingETH = false;
      loadingLTC = false;
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(selectedCurrency);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: loadingBTC
                        ? SpinKitWave(
                            color: Colors.white,
                            size: 20.0,
                          )
                        : Text(
                            '1 BTC = $convertedBTC $selectedCurrency',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: loadingETH
                        ? SpinKitWave(color: Colors.white, size: 20.0)
                        : Text(
                            '1 ETH = $convertedETH $selectedCurrency',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: loadingLTC
                        ? SpinKitWave(color: Colors.white, size: 20.0)
                        : Text(
                            '1 LTC = $convertedLTC $selectedCurrency',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getCupertinoPicker() : getDropdownButton(),
          ),
        ],
      ),
    );
  }
}
