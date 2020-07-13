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

class _HomeScreenState extends State<HomeScreen> {
  List<User> _contactsList = [];
  List<User> _searchedList = [];
  User _myProfileData;
  bool _showDetailedCount;
  TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    this._contactsList = contacts;
    this._searchedList = contacts;
    this._myProfileData = myProfile;
    _showDetailedCount = false;
    _searchController = TextEditingController();
  }

  toggleShowDetailedCount() {
    this.setState(() {
      _showDetailedCount = !_showDetailedCount;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Header(),
            RecentContactsSlider(
              contacts: this._contactsList,
              myProfile: this._myProfileData,
            ),
            SearchBar(
                contacts: this._contactsList,
                showDetailedCount: this._showDetailedCount,
                toggleShowDetailedCount: this.toggleShowDetailedCount,
                searchController: this._searchController,
                onSearchChange: this.onSearchChangedHandler),
            Chat(contacts: this._searchedList)
          ],
        ),
      ),
    );
  }
}
