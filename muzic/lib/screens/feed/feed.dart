import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import '../../common/data.dart';
import '../../common/events.dart';
import 'components/feed_body/feed_body.dart';
import 'components/feed_searchbar/feed_searchbar.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  TextEditingController _searchController;
  FocusNode _searchFocusNode;

  KeyboardVisibilityNotification _keyboardVisibility =
      new KeyboardVisibilityNotification();
  int _keyboardVisibilitySubscriberId;

  @override
  void initState() {
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();

    _keyboardVisibilitySubscriberId = _keyboardVisibility.addNewListener(
      onChange: (bool visible) {
        if (!visible) {
          _searchFocusNode.unfocus();
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();

    _keyboardVisibility.removeListener(_keyboardVisibilitySubscriberId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: FeedSearchBar(
          controller: _searchController,
          focusNode: _searchFocusNode,
        ),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            eventBus.fire(DrawerEvent(true));
          },
          child: Icon(
            Icons.view_headline,
            size: 30,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
      body: FeedBody(),
    );
  }
}
