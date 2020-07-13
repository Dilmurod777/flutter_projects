import 'dart:ui';
import 'package:chat_contacts_list/constraints.dart';
import 'package:chat_contacts_list/modals/user.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  final User user;

  const MyProfile({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                height: 86,
                width: 86,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(user.imgUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(33),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(33),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.0),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -11.5,
                left: 21,
                child: Container(
                  height: 23,
                  width: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF719CF7),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.favorite, size: 12, color: Colors.white),
                      Text("${user.likes}", style: kUserPopularityStyle)
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 15.0),
          Text('Новый лайков')
        ],
      ),
    );
  }
}
