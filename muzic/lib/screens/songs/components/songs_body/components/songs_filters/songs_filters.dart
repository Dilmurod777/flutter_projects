import 'package:flutter/material.dart';

import 'package:muzic/common/data.dart';
import 'package:muzic/common/events.dart';
import 'package:muzic/custom/custom_scroll_behavior/custom_scroll_behavior.dart';

class SongsFilters extends StatelessWidget {
  final int currentPage;

  const SongsFilters({
    Key key,
    @required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: filters.map((filter) {
            int index = filters.indexOf(filter);

            return InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                eventBus.fire(FiltersEvent(index));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: currentPage == index
                          ? Color(0xFFD9519D)
                          : Colors.transparent,
                    ),
                  ),
                ),
                child: Text(
                  filter,
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: currentPage == index
                        ? Color(0xFFD9519D)
                        : Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
