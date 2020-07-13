import 'package:chat_contacts_list/components/search_input.dart';
import 'package:chat_contacts_list/constraints.dart';
import 'package:chat_contacts_list/modals/user.dart';
import 'package:chat_contacts_list/screens/home/components/search_bar/components/detailed_count_elements.dart';
import 'package:chat_contacts_list/screens/home/components/search_bar/components/left_person_btn.dart';
import 'package:chat_contacts_list/screens/home/components/search_bar/components/right_search_btn.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final List<User> contacts;
  final bool showDetailedCount;
  final Function setShowDetailedCount;
  final Function onSearchChange;
  final TextEditingController searchController;
  final GlobalKey<AnimatedListState> listKey;

  const SearchBar({
    Key key,
    this.listKey,
    this.contacts,
    this.showDetailedCount,
    this.setShowDetailedCount,
    this.onSearchChange,
    this.searchController,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  var isSearchFocused = false;

  toggleSearchFocusedHandler() {
    this.setState(() {
      isSearchFocused = !isSearchFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: kSearchBarTopPadding,
        bottom: kSearchBarBottomPadding,
        left: kSearchBarLeftPadding,
        right: kSearchBarRightPadding,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              isSearchFocused
                  ? LeftPersonBtn(
                      showDetailedCount: widget.showDetailedCount,
                      setShowDetailedCount: widget.setShowDetailedCount,
                    )
                  : Container(),
              Expanded(
                child: SearchInput(
                  icon: Icons.person,
                  text: 'Все пользователи',
                  count: widget.contacts.length,
                  addRightMargin: true,
                  disabled: false,
                  showDetailedCount: widget.showDetailedCount,
                  onChange: widget.onSearchChange,
                  onSearchFocused: toggleSearchFocusedHandler,
                  onToggleShowDetailedCount: widget.setShowDetailedCount,
                  isSearchFocused: isSearchFocused,
                  controller: widget.searchController,
                ),
              ),
              isSearchFocused
                  ? Container()
                  : RightSearchBtn(
                      toggleSearchFocusedHandler: toggleSearchFocusedHandler,
                    )
            ],
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 350),
            child: widget.showDetailedCount
                ? DetailedCountElements(contacts: widget.contacts)
                : Container(),
          ),
        ],
      ),
    );
  }
}
