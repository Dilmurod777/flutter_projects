import 'package:chat_contacts_list/modals/user.dart';
import 'package:chat_contacts_list/screens/home/components/recent_contacts/my_profile.dart';
import 'package:chat_contacts_list/screens/home/components/recent_contacts/recent_contact_item.dart';
import 'package:chat_contacts_list/constraints.dart';
import 'package:flutter/material.dart';

class RecentContactsSlider extends StatefulWidget {
  final List<User> contacts;
  final User myProfile;
  final double scrollDelta;

  const RecentContactsSlider({
    Key key,
    this.contacts,
    this.myProfile,
    this.scrollDelta,
  }) : super(key: key);

  @override
  _RecentContactsSliderState createState() => _RecentContactsSliderState();
}

class _RecentContactsSliderState extends State<RecentContactsSlider> {
  double height = 125.0;
  double contactSize = 86.0;
  double marginRight = 16.0;
  double sizedBoxHeight = 15.0;
  double textHeight = 20;
  double textOpacity = 1;
  double borderRadius = 33;
  double positionedBottom = -11;
  double positionedLeft = 21;

  @override
  Widget build(BuildContext context) {
    final heightDeltaFactor = widget.scrollDelta < 0 ? 5 : 20;
    final textScrollDelta =
        height > 110 ? widget.scrollDelta * 5 : 0;

    final recentContactsList = widget.contacts.map(
      (user) => RecentContactItem(
          user: user,
          size: contactSize =
              (contactSize + widget.scrollDelta / 2).clamp(66.0, 86.0),
          marginRight: marginRight =
              (marginRight + widget.scrollDelta).clamp(12.0, 16.0),
          sizedBoxHeight: sizedBoxHeight =
              (sizedBoxHeight + textScrollDelta).clamp(0.0, 15.0),
          textHeight: textHeight =
              (textHeight + textScrollDelta).clamp(0.0, 20.0),
          textOpacity: textOpacity =
              (textOpacity + textScrollDelta).clamp(0.0, 1.0),
          borderRadius: borderRadius =
              (borderRadius + widget.scrollDelta).clamp(25.0, 33.0),
          positionedBottom: positionedBottom =
              (positionedBottom - widget.scrollDelta * 2).clamp(-11.0, 21.5),
          positionedLeft: positionedLeft =
              (positionedLeft + widget.scrollDelta * 5).clamp(11.0, 21.0)),
    );

    return Padding(
      padding: EdgeInsets.only(left: kHeaderLeftPadding),
      child: Container(
        height: height = (height + widget.scrollDelta * heightDeltaFactor).clamp(70.0, 125.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            MyProfile(
              user: widget.myProfile,
              size: contactSize =
                  (contactSize + widget.scrollDelta).clamp(66.0, 86.0),
              marginRight: marginRight =
                  (marginRight + widget.scrollDelta).clamp(12.0, 16.0),
              sizedBoxHeight: sizedBoxHeight =
                  (sizedBoxHeight + textScrollDelta).clamp(0.0, 15.0),
              textHeight: textHeight =
                  (textHeight + textScrollDelta).clamp(0.0, 20.0),
              textOpacity: textOpacity =
                  (textOpacity + textScrollDelta).clamp(0.0, 1.0),
              borderRadius: borderRadius =
                  (borderRadius + widget.scrollDelta).clamp(25.0, 33.0),
              positionedBottom: positionedBottom =
                  (positionedBottom - widget.scrollDelta * 2)
                      .clamp(-11.0, 21.5),
              positionedLeft: positionedLeft =
                  (positionedLeft + widget.scrollDelta * 5).clamp(11.0, 21.0),
            ),
            ...recentContactsList,
          ],
        ),
      ),
    );
  }
}
