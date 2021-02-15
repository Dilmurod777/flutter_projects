import 'package:flutter/material.dart';

class FeedSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const FeedSearchBar({
    Key key,
    @required this.focusNode,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFF292E4B),
        borderRadius: BorderRadius.circular(19),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search, color: Colors.white.withOpacity(0.35), size: 22),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              autofocus: false,
              focusNode: focusNode,
              controller: controller,
              cursorColor: Colors.white,
              cursorWidth: 1,
              textAlignVertical: TextAlignVertical.top,
              style: TextStyle(
                fontFamily: 'CircularStd',
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search album.dart, song',
                hintStyle: TextStyle(
                  fontFamily: 'CircularStd',
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  color: Colors.white.withOpacity(0.2),
                ),
                contentPadding: EdgeInsets.fromLTRB(0, 0, 15, 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
