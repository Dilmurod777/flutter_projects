import 'package:chat_contacts_list/modals/user.dart';
import 'package:chat_contacts_list/screens/home/components/recent_contacts/my_profile.dart';
import 'package:chat_contacts_list/screens/home/components/recent_contacts/recent_contact_item.dart';
import 'package:chat_contacts_list/constraints.dart';
import 'package:flutter/material.dart';

class RecentContactsSlider extends StatelessWidget {
  final List<User> contacts;
  final User myProfile;
  final bool showScrollEffect;
  final Animation sliderAnimation;

  const RecentContactsSlider(
      {Key key,
      this.contacts,
      this.myProfile,
      this.showScrollEffect,
      this.sliderAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recentContactsList = contacts.map(
      (user) => RecentContactItem(
        user: user,
        showScrollEffect: showScrollEffect,
        animation: sliderAnimation,
      ),
    );

    return Padding(
      padding: EdgeInsets.only(left: kHeaderLeftPadding),
      child: Container(
        height: 70 + 55 * sliderAnimation.value,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            MyProfile(
              user: myProfile,
              showScrollEffect: showScrollEffect,
              animation: sliderAnimation,
            ),
            ...recentContactsList,
          ],
        ),
      ),
    );
  }
}
