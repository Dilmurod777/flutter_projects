import 'package:flutter/material.dart';

class ErrorModal {
  final BuildContext context;
  final String errorMessage;

  ErrorModal({this.context, this.errorMessage});

  void show() {
    showModalBottomSheet(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.redAccent,
                size: 35.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
