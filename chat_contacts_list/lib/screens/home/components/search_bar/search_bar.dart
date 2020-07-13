import 'package:chat_contacts_list/components/search_input.dart';
import 'package:chat_contacts_list/constraints.dart';
import 'package:chat_contacts_list/modals/user.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final List<User> contacts;
  final bool showDetailedCount;
  final Function toggleShowDetailedCount;
  final Function onSearchChange;
  final TextEditingController searchController;

  const SearchBar({
    Key key,
    this.contacts,
    this.showDetailedCount,
    this.toggleShowDetailedCount,
    this.onSearchChange,
    this.searchController,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  var isSearchFocused = false;

  toggleSearchFocusedHandler(){
    this.setState(() {
      isSearchFocused = !isSearchFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kHPadding,
        vertical: kVPadding,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              isSearchFocused
                  ? Container(
                      width: 39,
                      height: 39,
                      margin: EdgeInsets.only(right: 7),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFF9F9F9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 25,
                        color: Color(0xFF131313),
                      ),
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
                  onCountClick: widget.toggleShowDetailedCount,
                  onChange: widget.onSearchChange,
                  onTap: toggleSearchFocusedHandler,
                  isSearchFocused: isSearchFocused,
                  controller: widget.searchController,
                ),
              ),
              isSearchFocused
                  ? Container()
                  : InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 39,
                        height: 39,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.search,
                          size: 25,
                          color: Color(0xFF131313),
                        ),
                      ),
                    )
            ],
          ),
          widget.showDetailedCount == true
              ? Column(
                  children: <Widget>[
                    SearchInput(
                      icon: Icons.wifi_tethering,
                      text: 'Только онлайн',
                      count: widget.contacts
                          .where((contact) => contact.isOnline)
                          .length,
                      addRightMargin: false,
                      disabled: true,
                    ),
                    SearchInput(
                      icon: Icons.bookmark_border,
                      text: 'Избранные',
                      count: widget.contacts
                          .where((contact) => contact.isPinned)
                          .length,
                      addRightMargin: false,
                      disabled: true,
                    )
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
