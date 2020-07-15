import 'package:chat_contacts_list/data.dart';
import 'package:chat_contacts_list/modals/user.dart';
import 'package:chat_contacts_list/screens/home/components/chat/chat.dart';
import 'package:chat_contacts_list/screens/home/components/header/header.dart';
import 'package:chat_contacts_list/screens/home/components/recent_contacts/recent_contacts_slider.dart';
import 'package:chat_contacts_list/screens/home/components/search_bar/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<User> _contactsList = [];
  List<User> _searchedList = [];
  User _myProfileData;
  bool _showDetailedCount;
  TextEditingController _searchController;

  bool _showScrollEffect = false;
  ScrollController _scrollController;

  double scrollPrevPos = 0;
  double scrollCurPos = 0;
  double scrollDeltaPos = 0;

  onSearchChangedHandler(value) {
    if (value == '') {
      this.setState(() {
        _searchedList = _contactsList;
      });
    } else {
      final firstNameSearch = _contactsList
          .where((contact) => contact.firstName.toLowerCase().contains(value))
          .toList();
      final lastNameSearch = _contactsList
          .where((contact) => contact.lastName.toLowerCase().contains(value))
          .toList();
      final lastMessageSearch = _contactsList
          .where((contact) =>
              contact.history.last.text.toLowerCase().contains(value))
          .toList();

      this.setState(() {
        _searchedList = [
          ...firstNameSearch,
          ...lastNameSearch,
          ...lastMessageSearch
        ].toSet().toList();
      });
    }
  }

  setShowDetailedCount(value) {
    this.setState(() {
      _showDetailedCount = value;
    });
  }

  scrollHandler() async {
    _scrollController.addListener(() {
      if ((_scrollController.position.pixels -
                  _scrollController.position.maxScrollExtent)
              .abs() >
          10) {
        this.setState(() {
          scrollPrevPos = scrollCurPos;
          scrollCurPos = _scrollController.position.pixels.toDouble();
          scrollDeltaPos = scrollPrevPos - scrollCurPos;
        });
      }
    });
  }

  defaultSortedChat() {
    List<User> unreadContacts = [];
    List<User> readContacts = [];

    contacts.forEach((contact) {
      if (contact.history.where((m) => !m.isRead).length > 0) {
        unreadContacts.add(contact);
      } else {
        readContacts.add(contact);
      }
    });

    // sort by number of unread messages
    unreadContacts.sort((a, b) {
      final unreadCountA = a.history.where((m) => !m.isRead).length;
      final unreadCountB = b.history.where((m) => !m.isRead).length;
      return unreadCountB - unreadCountA;
    });

    // sort by the last unread message time
    unreadContacts.sort((a, b) {
      final lastMessageTimeA = a.history.last.time;
      final lastMessageTimeB = b.history.last.time;

      return lastMessageTimeB.difference(lastMessageTimeA).inSeconds;
    });

    return [...unreadContacts, ...readContacts];
  }

  showOnlineFirstChat() {
    List<User> onlineContacts = [];
    List<User> offlineContacts = [];

    _contactsList.forEach((contact) => {
          if (contact.isOnline)
            {onlineContacts.add(contact)}
          else
            {offlineContacts.add(contact)}
        });

    this.setState(() {
      _searchedList = [...onlineContacts, ...offlineContacts];
    });
  }

  showPinnedFirstChat() {
    List<User> pinnedContacts = [];
    List<User> unpinnedContacts = [];

    _contactsList.forEach((contact) => {
          if (contact.isPinned)
            {pinnedContacts.add(contact)}
          else
            {unpinnedContacts.add(contact)}
        });

    this.setState(() {
      _searchedList = [...pinnedContacts, ...unpinnedContacts];
    });
  }

  @override
  void initState() {
    super.initState();
    _contactsList = defaultSortedChat();
    _searchedList = _contactsList;
    _myProfileData = myProfile;
    _showDetailedCount = false;
    _searchController = TextEditingController();
    _scrollController = ScrollController();

    scrollHandler();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 44),
        child: Column(
          children: <Widget>[
            Header(scrollDelta: scrollDeltaPos),
            RecentContactsSlider(
              contacts: this._contactsList,
              myProfile: this._myProfileData,
              scrollDelta: scrollDeltaPos * 5,
            ),
            SearchBar(
              contacts: this._contactsList,
              showDetailedCount: this._showDetailedCount,
              setShowDetailedCount: this.setShowDetailedCount,
              showOnlineChat: this.showOnlineFirstChat,
              showPinnedChat: this.showPinnedFirstChat,
              searchController: this._searchController,
              onSearchChange: this.onSearchChangedHandler,
            ),
            Chat(
              contacts: this._searchedList,
              scrollController: _scrollController,
              showScrollEffect: _showScrollEffect,
            )
          ],
        ),
      ),
    );
  }
}
